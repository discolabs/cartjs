# Utility methods.
# ----------------

wrapKeys = (obj, type = 'attributes') ->
  wrapped = {}
  for key, value of obj
    wrapped["#{type}[#{key}]"] = value
  wrapped