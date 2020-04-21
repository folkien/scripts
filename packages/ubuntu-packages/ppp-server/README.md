# Instalacja i konfiguracja serwera PPP linux - `pppd`


# Pliki konfiguracyjne

Instalacja plików konfiguracyjnych odbywa się za pomoca polecenia `install.sh`.

etc/
├── ppp
│   ├── options - ustawienia serwera PPP
│   └── pap-secrets - plik z hasłami/login do PPP. Dodano hasło do K1 DUO.
├── sysctl.d
│   └── 30-ipforward.conf - włączenie forwarding TCP/IP dla IPv4
└── systemd
    └── system
        └── ppp-server.service - serwis systemd, który automatycznie odnawia serwer `pppd` na porcie szeregowym usb. 
                                 Należy uruchomić za pomocą 'systemctl enable'.

└── udev
    └── rules.d
        └── 20-k1duo.rules - zasady udeva które tworza odpowiednie porty. ttyECR dla połączenia z kasą. ttyECRPP dla połączenia PPP.
