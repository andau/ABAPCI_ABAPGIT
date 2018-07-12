"#autoformat
class ltcl_abapgit_package_changer DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      standard_e2e_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_abapgit_package_changer IMPLEMENTATION.

  METHOD standard_e2e_test.
    "DATA(zcl_abapgit_package_changer) = NEW zcl_abapgit_package_changer( ).
    "DATA(changed) = zcl_abapgit_package_changer->change_package( EXPORTING packagename = `SAMPLE_PACKAGE` username = `SAMPLE_USERNAME`  ).
    "cl_abap_unit_assert=>assert_equals( msg = 'Change was sucessfull' exp = abap_true act = changed ).
  ENDMETHOD.

ENDCLASS.
