<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
    <xsl:output encoding="UTF-8"/>
    <xsl:template match="applicant">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                                       page-width="9in" page-height="11in"
                                       margin-top="0.5in" margin-bottom="0.5in"
                                       margin-left="1in">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table table-layout="fixed"
                              width="75%"
                              font-size="10pt"
                              border-color="black"
                              text-align="left"
                              space-after="5mm"
                              border-width="0.05mm"
                              border-style="solid">
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
                                        <xsl:choose>
                                            <xsl:when
                                                    test="../check_conditions/serviceConditions/condition[condition_id=4584]/cnd/condition_name=9840">
                                                <xsl:value-of
                                                        select="applicant-lastName"/>
                                                <fo:inline>&#160;</fo:inline>
                                                <xsl:value-of
                                                        select="applicant-firstName"/>
                                                <fo:inline>&#160;</fo:inline>
                                                <xsl:value-of
                                                        select="applicant-middleName"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                        select="applicant-representative/applicant-repLastName"/>
                                                <fo:inline>&#160;</fo:inline>
                                                <xsl:value-of
                                                        select="applicant-representative/applicant-repFirstName"/>
                                                <fo:inline>&#160;</fo:inline>
                                                <xsl:value-of
                                                        select="applicant-representative/applicant-repMiddleName"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
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
                    <fo:block font-family="TIMES"
                              text-align="center"
                              margin-bottom="10pt"
                              margin-left="-1in">
                        <fo:block>
                            ЗАЯВЛЕНИЕ
                        </fo:block>
                        <fo:block>
                            о предоставлении государственной услуги
                        </fo:block>
                    </fo:block>
                    <fo:table table-layout="fixed"
                              width="75%"
                              font-family="TIMES"
                              space-after="5mm">
                        <fo:table-column column-number="1" column-width="10%"/>
                        <fo:table-column column-number="2" column-width="90%"/>
                        <fo:table-header text-align="left">
                            <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                    <fo:block>
                                        Прошу выдать (поставить отметку «V»)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body border-style="solid" border-width="0.3mm">
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4585]/cnd/condition_name=9842">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        удостоверение многодетной семьи (далее – удостоверение)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4585]/cnd/condition_name=9843">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        продления срока действия удостоверения
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4585]/cnd/condition_name=9844">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        замена удостоверения
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        &#160;
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        &#160;
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:table table-layout="fixed"
                              width="75%"
                              font-family="TIMES">
                        <fo:table-column column-number="1" column-width="10%"/>
                        <fo:table-column column-number="2" column-width="90%"/>
                        <fo:table-header text-align="left">
                            <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                    <fo:block>
                                        Сдаю удостоверение по следующим обстоятельствам (поставить отметку «V»)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body border-style="solid" border-width="0.3mm">
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4594]/cnd/condition_name=9867">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        истечения срока действия удостоверения
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4594]/cnd/condition_name=9868">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        смерти родителей (единственного родителя) и (или) ребенка (детей)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4594]/cnd/condition_name=9869">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        передачи ребенка на полное государственное обеспечение (если в семье при этом
                                        остается менее трех несовершеннолетних детей)
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4594]/cnd/condition_name=9870">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        лишения родителей родительских прав или ограничения родителей в родительских
                                        правах
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        <xsl:if test="../check_conditions/serviceConditions/condition[condition_id=4594]/cnd/condition_name=9871">
                                            V
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-style="solid" border-width="0.3mm">
                                    <fo:block>
                                        переезда многодетной семьи, многодетной приемной семьи на постоянное место
                                        жительство за пределы территории Ленинградской области
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