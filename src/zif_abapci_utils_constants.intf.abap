"#autoformat
INTERFACE zif_abapci_utils_constants
  PUBLIC .
  CONSTANTS:
    co_change_pack_resource_scheme TYPE string VALUE 'http://www.abapci.com/abapci/abapgit',
    co_change_pack_res_controller  TYPE string VALUE 'ZCL_ABAPCI_REST_RESOURCE',
    co_change_pack_static_uri      TYPE string VALUE '/abapci/abapgit',
    co_change_pack_term            TYPE string VALUE 'change_package',
    co_change_pack_url             TYPE string VALUE '/change_package',
    co_abapci_utils_app_title      TYPE string VALUE 'AbapCi',
    co_abapci_utils_res_scheme     TYPE string VALUE 'http://www.abapci.com/abapci',
    co_abapci_utils_static_uri     TYPE string VALUE '/abapci'.

ENDINTERFACE.
