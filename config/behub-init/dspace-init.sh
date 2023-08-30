
# This script is provided as example of initialization of behub structure
# commands can be executed one by one to check results
# Note: additional administration actions must be made from web interface to accomplish 
# full initialization (e.g. collections data-type setting)

cd ../..

# Communities/Collections structure import
# https://wiki.lyrasis.org/display/DSDOC7x/Exporting+and+Importing+Community+and+Collection+Hierarchy
./bin/dspace structure-builder -e test@test.edu -f config/behub-init/behub-structure-export.xml -o /tmp/out.xml
./bin/dspace structure-builder -e test@test.edu -f config/behub-init/behub-system-structure-export.xml -o /tmp/out2.xml

# elements/namespaces EML 2.2.0 registry import
./bin/dspace registry-loader -metadata config/registries/behub-dataset-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-party-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-coverage-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-conf-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-project-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-dataTable-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-annotation-types.xml
./bin/dspace registry-loader -metadata config/registries/behub-relationship-formats.xml

# Entities/Relationships
./bin/dspace initialize-entities -f config/entities/behub-relationship-types.xml

cd --
