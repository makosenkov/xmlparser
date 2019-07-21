<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output encoding="UTF-8"/>
 <xsl:template match="form_service">
     <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="A4">
                <fo:region-body/>
            </fo:simple-page-master>
        </fo:layout-master-set>
         <fo:page-sequence master-reference="A4">
             <fo:flow flow-name="xsl-region-body">
                 <fo:table table-layout="fixed"
                           width="60%"
                           font-size="10pt"
                           border-color="black"
                           border-width="0.1mm"
                           border-style="solid"
                           text-align="left"
                           display-align="center"
                           space-after="5mm">
                     <fo:table-body font-family="TIMES">
                         <fo:table-row>
                             <fo:table-cell>
                                 <fo:block>В</fo:block>
                                 <fo:block>(наименование филиала ЦСЗН)</fo:block>
                             </fo:table-cell>
                         </fo:table-row>
                         <fo:table-row>
                             <fo:table-cell>
                                 <fo:block>
                                     от заявителя
                                 </fo:block>
                             </fo:table-cell>
                             <fo:table-cell>
                                 <fo:block>
                                     <xsl:value-of select="original_form_service/MfcService/applicant/applicant-lastName"/>
                                     <fo:inline>&#160;</fo:inline>
                                     <xsl:value-of select="original_form_service/MfcService/applicant/applicant-firstName"/>
                                     <fo:inline>&#160;</fo:inline>
                                     <xsl:value-of select="original_form_service/MfcService/applicant/applicant-middleName"/>
                                 </fo:block>
                             </fo:table-cell>
                         </fo:table-row>


                     </fo:table-body>
                 </fo:table>
             </fo:flow>
         </fo:page-sequence>
     </fo:root>


 </xsl:template>

</xsl:stylesheet>