<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
    <xsl:output encoding="UTF-8"/>
    <xsl:template match="applicant">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table table-layout="fixed"
                              width="75%"
                              margin-left="25pt"
                              font-size="10pt"
                              border-color="black"
                              border-width="0.1mm"
                              border-style="solid"
                              text-align="left"
                              display-align="center"
                              space-after="5mm"
                              margin-top="35px">
                        <fo:table-body font-family="TIMES">
                            <fo:table-row>
                                <fo:table-cell width="150px">
                                    <fo:block>В</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-family="COURIER-NEW">
                                        <xsl:value-of select="../application/АдресМФЦУд"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell width="150px">
                                    <fo:block></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>(наименование филиала ЦСЗН)</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell width="150px">
                                    <fo:block>
                                        от заявителя
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-family="COURIER-NEW">
                                        <xsl:value-of
                                                select="applicant-lastName"/>
                                        <fo:inline>&#160;</fo:inline>
                                        <xsl:value-of
                                                select="applicant-firstName"/>
                                        <fo:inline>&#160;</fo:inline>
                                        <xsl:value-of
                                                select="applicant-middleName"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="left">
                                        (фамилия, имя отчество заполняется заявителем)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-width="0.1mm" border-style="solid">
                                <fo:table-cell>
                                    <fo:block>
                                        Адрес места жительства заявителя
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell font-family="COURIER-NEW">
                                    <fo:block>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrIndex"/>
                                        <fo:inline>&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrRegion"/>
                                        <fo:inline>&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrDistrict"/>
                                        <fo:inline>&#160;РАЙОН&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrCity"/>
                                        <fo:inline>&#160;ул.&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrStreet"/>
                                        <fo:inline>&#160;дом&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrHouse"/>
                                        <fo:inline>&#160;к.&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrHousing"/>
                                        <fo:inline>&#160;кв.&#160;</fo:inline>
                                        <xsl:value-of select="applicant-resident_address/applicant-addrFlat"/>
                                        <fo:inline>&#160;</fo:inline>
                                    </fo:block>
                                    <fo:block font-family="TIMES">
                                        (почтовый индекс, район, населенный пункт, улица, дом, корпус, квартира)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:if test="applicant-addrSame!='checked'">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            Адрес регистрации
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell font-family="COURIER-NEW">
                                        <fo:block>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegIndex"/>
                                            <fo:inline>&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegRegion"/>
                                            <fo:inline>&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegDistrict"/>
                                            <fo:inline>&#160;РАЙОН&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegCity"/>
                                            <fo:inline>&#160;ул.&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegStreet"/>
                                            <fo:inline>&#160;дом&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegHouse"/>
                                            <fo:inline>&#160;к.&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegHousing"/>
                                            <fo:inline>&#160;кв.&#160;</fo:inline>
                                            <xsl:value-of select="applicant-reg_address/applicant-addrRegFlat"/>
                                            <fo:inline>&#160;</fo:inline>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                            <fo:table-row border-width="0.1mm" border-style="solid">
                                <fo:table-cell>
                                    <fo:block font-family="COURIER-NEW">
                                        <xsl:value-of select="applicant-snils"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-width="0.1mm" border-style="solid">
                                <fo:table-cell number-columns-spanned="2">
                                    <fo:block text-align="center">
                                        страховой номер индивидуального лицевого счета (СНИЛС) – заполняется при
                                        первичном обращении
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>
                                            Телефон
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-family="COURIER-NEW">
                                        <xsl:value-of select="applicant-phone"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="TIMES" text-align="center">
                        ЗАЯВЛЕНИЕ
                    </fo:block>
                    <fo:block font-family="TIMES" text-align="center">
                        о предоставлении государственной услуги
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>