"#autoformat
CLASS zcl_abapci_rest_resource DEFINITION
  PUBLIC
  INHERITING FROM cl_adt_rest_resource
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS co_class_name TYPE seoclsname VALUE 'ZCL_ABAPCI_REST_RESOURCE'. "#EC NOTEXT
    CONSTANTS co_resource_type TYPE string VALUE 'ABAPCI'.  "#EC NOTEXT
    CONSTANTS co_st_name TYPE string VALUE 'ZADT_ABAPCI'.   "#EC NOTEXT
    CONSTANTS co_root_name TYPE string VALUE 'ABAPCI_DATA'.


    CLASS-METHODS get_content_handler
      RETURNING VALUE(result) TYPE REF TO if_adt_rest_content_handler .
    METHODS:
      post REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS get_package_info_from_uri
      IMPORTING request      TYPE REF TO if_adt_rest_request
      EXPORTING package_name TYPE string
                username     TYPE string
      RAISING   cx_adt_rest.

ENDCLASS.



CLASS zcl_abapci_rest_resource IMPLEMENTATION.

  METHOD get_content_handler.
    result = cl_adt_tools_core_factory=>get_instance( )->get_object_references_cnt_hndl( ).
  ENDMETHOD.

  METHOD  post.

    get_package_info_from_uri(
      EXPORTING request = request
      IMPORTING
      package_name = DATA(packagename)
      username = DATA(username) ).


    DATA(zcl_abapgit_package_changer) = NEW zcl_abapgit_package_changer( ).
    DATA(successful) = zcl_abapgit_package_changer->change_package( EXPORTING packagename =  packagename username = username ).


    "response->set_body_data(
    "   content_handler = get_content_handler( )
    "   data            = 'Hello World' ).

  ENDMETHOD.

  METHOD get_package_info_from_uri.

    request->get_uri_query_parameter(
    EXPORTING
    name      = 'packagename'
    mandatory = abap_true
    IMPORTING
    value     = package_name ).

    request->get_uri_query_parameter(
    EXPORTING
    name      = 'username'
    mandatory = abap_true
    IMPORTING
    value     = username ).

  ENDMETHOD.

ENDCLASS.
