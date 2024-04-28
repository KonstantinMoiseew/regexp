#!/usr/bin/env bash

ALNUM="0-9a-zA-Z"

SCHEME="[a-zA-Z][${ALNUM}+.\-]*"

# no password in userinfo (deprecated)
USERINFO="[${ALNUM}_\-]+"
T_USERINFO="(${USERINFO}@)?"

LABEL="[${ALNUM}\-]+"
T_HOST="${LABEL}(\.${LABEL})*"

T_PORT="(:[0-9]+)?"

AUTHORITY="${T_USERINFO}${T_HOST}${T_PORT}"
T_AUTHORITY="(//$AUTHORITY)?"

PATH="(/[${ALNUM}_%.\-]*)*"

PAIR="([${ALNUM}_]+(=[$ALNUM]*)?)?"

QUERY="${PAIR}(&${PAIR})*"
T_QUERY="(\?$QUERY)?"

FRAGMENT="[${ALNUM}_\-]*"
T_FRAGMENT="(#$FRAGMENT)?"


T_REGEX="^${SCHEME}:${T_AUTHORITY}${PATH}${T_QUERY}${T_FRAGMENT}\$"
# echo "$T_REGEX"

echo "Enter a string to check it out if it is URL"
read INPUT

if (echo ${INPUT} | /usr/bin/grep --color=always -E "${T_REGEX}")
then
          echo "This is a URL"
else
          echo "This is not a URL"
          exit 1
fi

