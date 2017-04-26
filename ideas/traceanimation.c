
  /***************************************************************************//**
  * @brief  Function shows rotating cursor when waiting
  *
  * @return void
  ******************************************************************************/
  void trace_loadingAnimation()
  {
    static uint8_t positionInArray = 0;
    uint8_t animationArray[] = {'-','\\','|','/','-','\\','|','/'};
    trace_notime(TRACE_INFO, "\b%c",animationArray[positionInArray++]);
    positionInArray %= array_sizeof(animationArray);
  }
