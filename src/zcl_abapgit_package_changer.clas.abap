"#autoformat
CLASS zcl_abapgit_package_changer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: change_package IMPORTING packagename       TYPE string
                                      username          TYPE string
                            RETURNING VALUE(successful) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      check_for_existing_config IMPORTING username          TYPE string
                                RETURNING VALUE(successful) TYPE abap_bool.

ENDCLASS.



CLASS zcl_abapgit_package_changer IMPLEMENTATION.

  METHOD change_package.
    IF ( check_for_existing_config(  username = username ) ).

      DATA abapgit_configs TYPE TABLE OF zabapgit.
      DATA package_search_string TYPE string.
      DATA package_id TYPE zabapgit-type.

      package_search_string = `<PACKAGE>` && packagename && `</PACKAGE>`.

      SELECT * FROM zabapgit INTO TABLE @abapgit_configs
      WHERE type = 'REPO'.

      LOOP AT abapgit_configs ASSIGNING FIELD-SYMBOL(<abapgit_config>).
        IF <abapgit_config>-data_str CS package_search_string.
          package_id = <abapgit_config>-value.
        ENDIF.
      ENDLOOP.

    ELSE.
      package_id = -1.
    ENDIF.

    IF ( package_id > 0 ).
      DATA guid_16 TYPE guid_16.
      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_16 = guid_16.

      DATA zabapci TYPE zabapci.
      zabapci-guid = guid_16.
      zabapci-test_key = packagename.
      zabapci-test_value = username.
      zabapci-test_no = package_id.

      INSERT INTO zabapci VALUES zabapci.

      successful = abap_true.
    ELSE.
      successful = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD check_for_existing_config.

    DATA current_config TYPE zabapgit-data_str.

    SELECT SINGLE  data_str FROM zabapgit INTO @current_config
    WHERE type = 'USER' AND value = @username.

    IF sy-subrc = 0.
      successful = abap_true.
    ELSE.
      successful = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
