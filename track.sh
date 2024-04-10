#!/bin/bash
#
# tracks GBIF's "13_biotic_interactions" versions using Preston [1,2]
#
#
# [1] Elliott M.J., Poelen J.H., Fortes J.A.B. (2020). Toward Reliable Biodiversity Dataset References. Ecological Informatics. https://doi.org/10.1016/j.ecoinf.2020.101132 hash://sha256/136c3c1808bcf463bb04b11622bb2e7b5fba28f5be1fc258c5ea55b3b84f482c
#
# [2] Elliott M.J., Poelen, J.H. & Fortes, J.A.B. (2023) Signing data citations enables data verification and citation persistence. Sci Data. https://doi.org/10.1038/s41597-023-02230-y hash://sha256/f849c870565f608899f183ca261365dce9c9f1c5441b1c779e0db49df9c2a19d
#

GOOGLE_DOC_ID="1jzb54GbAkB_TOFIjWof5BW6gn1ujSnXXJQu6aZgFAB4"
DOC_ALIAS="13_biotic_interactions"

echo -e "docx\nodt\npdf\nrtf\ntxt"\
 | sed "s+^+https://docs.google.com/document/u/0/export?format=+g"\
 | sed "s+$+\&id=${GOOGLE_DOC_ID}+g"\
 | xargs preston track

preston alias | grep docx | head -n1 | preston cat > "${DOC_ALIAS}.docx"
preston alias | grep pdf | head -n1 | preston cat > "${DOC_ALIAS}.pdf"

