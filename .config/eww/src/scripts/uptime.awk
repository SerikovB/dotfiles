#!/usr/bin/env --split-string=awk --file

{
  gsub(/,*/, "");
  print $3;
}
