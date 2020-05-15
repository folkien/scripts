#!/bin/bash

HTMLFULLPATH="$1"
SENDER="$2"
SENDEREMAIL="$3"
SUBJECT="$4"
RECIPIENT="$5"

HTML=$(basename "${HTMLFULLPATH}")
SENDERDOMAIN=$(echo "${SENDEREMAIL}" | cut -d@ -f2)

if ! [[ "${RECIPIENT}" == '*<*' ]] ; then
  RECIPIENT="${RECIPIENT}"'<'"${RECIPIENT}"'>' # TO_NO_BRKTS_* SpamAssassin rules
fi

function atexit
{
  rm -rf "${TEMPDIR}" "${NEOMUTTCONFIG}" >/dev/null 2>&1
}

trap atexit INT TERM EXIT

TEMPDIR=$(mktemp -d)
mkdir -p "${TEMPDIR}/img"
grep "src=" "${HTMLFULLPATH}" | sed -e "s,.*src=\"\([^\"]*/\)*\([^\"/]*\)\".*,wget \1\2 -O ${TEMPDIR}/img/\2," > "${TEMPDIR}/getimg.sh"
bash "${TEMPDIR}/getimg.sh" >/dev/null 2>&1
sed -e 's,src="\([^"]*/\)*\([^"/]*\)",src="cid:\2@'${SENDERDOMAIN}'",g' < "${HTMLFULLPATH}" > "${TEMPDIR}/${HTML}"
SENDMAIL="${TEMPDIR}/sendmail.sh"

cat > "${SENDMAIL}" << EOF
#!/bin/bash
sed -e 's,Content-Disposition: attachment; filename="\([^"]*\)",Content-Disposition: inline; name="\1"\nContent-ID: <\1@'${SENDERDOMAIN}'>,' < /dev/stdin | sed -e 's,Content-Type: multipart/mixed;,Content-Type: multipart/related;,' | sendmail \$*
EOF

chmod a+rx "${SENDMAIL}"

NEOMUTTCONFIG=$(mktemp)

echo 'set from="'"${SENDER}"' <'"${SENDEREMAIL}"'>"' >> "${NEOMUTTCONFIG}"
echo 'set smtp_url=""' >> "${NEOMUTTCONFIG}"
echo 'set sendmail="'${SENDMAIL}'"' >> "${NEOMUTTCONFIG}"
echo "set content_type=text/html" >> "${NEOMUTTCONFIG}"

neomutt -F "${NEOMUTTCONFIG}" "${RECIPIENT}" -s "${SUBJECT}" -a "${TEMPDIR}/img/"* < "${TEMPDIR}/${HTML}"
