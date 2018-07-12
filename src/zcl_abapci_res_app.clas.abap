"#autoformat
CLASS zcl_abapci_res_app DEFINITION
  PUBLIC
  INHERITING FROM cl_adt_disc_res_app_base
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:if_adt_rest_rfc_application~get_static_uri_path REDEFINITION.
  PROTECTED SECTION.
    METHODS:
      get_application_title REDEFINITION,
      register_resources REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapci_res_app IMPLEMENTATION.


  METHOD get_application_title.
    result = zif_abapci_utils_constants=>co_abapci_utils_app_title.
  ENDMETHOD.


  METHOD if_adt_rest_rfc_application~get_static_uri_path.
    result = zif_abapci_utils_constants=>co_change_pack_static_uri.
  ENDMETHOD.


  METHOD register_resources.

    DATA collection TYPE REF TO if_adt_discovery_collection.

    collection = registry->register_discoverable_resource(
    url             = zif_abapci_utils_constants=>co_change_pack_url
    handler_class   = zif_abapci_utils_constants=>co_change_pack_res_controller
    description     = 'Change the current package of abapgit'
    category_scheme = zif_abapci_utils_constants=>co_change_pack_resource_scheme
    category_term   = zif_abapci_utils_constants=>co_change_pack_term ).

    "collection->register_disc_res_w_template(
    "EXPORTING
    "relation      = 'http://www.abapci.com/adt/abapci/singleaccess'
    "template      = '/abapci/discovery?packagename={packagename}&username={username}'
    "description   = 'Abapci access'
    "type          = 'application/xml'
    "handler_class =  'zcl_abapci_rest_resource' ).

  ENDMETHOD.
ENDCLASS.
