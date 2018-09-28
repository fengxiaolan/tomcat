package com.inspur.ucweb.utils;

import java.text.DateFormat;
import java.util.Date;

public class GetterUtil
{
  private static String[] _BOOLEANS = { "true", "t", "y", "on", "1" };

  public static boolean getBoolean(String value) {
    return getBoolean(value, false);
  }

  public static boolean getBoolean(String value, boolean defaultValue) {
    return get(value, defaultValue);
  }

  public static Date getDate(String value, DateFormat df) {
    return getDate(value, df, new Date());
  }

  public static Date getDate(String value, DateFormat df, Date defaultValue) {
    return get(value, df, defaultValue);
  }

  public static double getDouble(String value) {
    return getDouble(value, 0.0D);
  }

  public static double getDouble(String value, double defaultValue) {
    return get(value, defaultValue);
  }

  public static float getFloat(String value) {
    return getFloat(value, 0.0F);
  }

  public static float getFloat(String value, float defaultValue) {
    return get(value, defaultValue);
  }

  public static int getInteger(String value) {
    return getInteger(value, 0);
  }

  public static int getInteger(String value, int defaultValue) {
    return get(value, defaultValue);
  }

  public static long getLong(String value) {
    return getLong(value, 0L);
  }

  public static long getLong(String value, long defaultValue) {
    return get(value, defaultValue);
  }

  public static short getShort(String value) {
    return getShort(value);
  }

  public static short getShort(String value, short defaultValue) {
    return get(value, defaultValue);
  }

  public static String getString(String value) {
    return getString(value, "");
  }

  public static String getString(String value, String defaultValue) {
    return get(value, defaultValue);
  }

  public static boolean get(String value, boolean defaultValue) {
    if (Validator.isNotNull(value)) {
      try {
        value = value.trim();

        return (value.equalsIgnoreCase(_BOOLEANS[0])) || (value.equalsIgnoreCase(_BOOLEANS[1])) || (value.equalsIgnoreCase(_BOOLEANS[2])) || (value.equalsIgnoreCase(_BOOLEANS[3])) || (value.equalsIgnoreCase(_BOOLEANS[4]));
      }
      catch (Exception localException)
      {
      }

    }

    return defaultValue;
  }

  public static Date get(String value, DateFormat df, Date defaultValue) {
    try {
      Date date = df.parse(value.trim());

      if (date != null)
        return date;
    }
    catch (Exception localException) {
    }
    return defaultValue;
  }

  public static double get(String value, double defaultValue) {
    try {
      return Double.parseDouble(_trim(value));
    } catch (Exception localException) {
    }
    return defaultValue;
  }

  public static float get(String value, float defaultValue) {
    try {
      return Float.parseFloat(_trim(value));
    } catch (Exception localException) {
    }
    return defaultValue;
  }

  public static int get(String value, int defaultValue) {
    try {
      return Integer.parseInt(_trim(value));
    } catch (Exception localException) {
    }
    return defaultValue;
  }

  public static long get(String value, long defaultValue) {
    try {
      return Long.parseLong(_trim(value));
    } catch (Exception localException) {
    }
    return defaultValue;
  }

  public static short get(String value, short defaultValue) {
    try {
      return Short.parseShort(_trim(value));
    } catch (Exception localException) {
    }
    return defaultValue;
  }

  public static String get(String value, String defaultValue) {
    if (Validator.isNotNull(value)) {
      value = value.trim();
      value = value.replaceAll("\r\n", "\n");

      return value;
    }

    return defaultValue;
  }

  private static String _trim(String value) {
    if (value != null) {
      value = value.trim();

      StringBuffer sb = new StringBuffer();

      char[] charArray = value.toCharArray();

      for (int i = 0; i < charArray.length; i++) {
        if ((Character.isDigit(charArray[i])) || ((charArray[i] == '-') && (i == 0)) || (charArray[i] == '.'))
        {
          sb.append(charArray[i]);
        }
      }
      value = sb.toString();
    }

    return value;
  }

  static class Validator
  {
    public static boolean isNull(String s) {
      if (s == null) {
        return true;
      }

      s = s.trim();

      return (s.equals("null")) || (s.equals(""));
    }

    public static boolean isNotNull(String s) {
      return !isNull(s);
    }
  }
}