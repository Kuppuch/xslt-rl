<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
<!--    <xsl:template match="/">-->
<!--        <html><body>-->
<!--            <xsl:apply-templates/>-->
<!--        </body></html>-->
<!--    </xsl:template>-->

<!--    <xsl:template match="/name">-->
<!--        <h1 align="center"> <xsl:apply-templates/> </h1>-->
<!--    </xsl:template>-->

    <xsl:template match="/">
        <html>
            <body>
                <h2>Задачи</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Задача</th>
                        <th>Описание</th>
                        <th>Статус</th>
                        <th>Исполнитель</th>
                        <th>Автор</th>
                        <th>Дата начала</th>
                        <th>Дата конца</th>
                    </tr>
                    <xsl:for-each select="Project/IssueList/Issue">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="description"/></td>
                            <td><xsl:value-of select="status"/></td>
                            <td><xsl:value-of select="assigned_to/name"/> <xsl:value-of select="assigned_to/lastname"/></td>
                            <td><xsl:value-of select="author/name"/> <xsl:value-of select="author/lastname"/></td>
                            <td><xsl:value-of select="start_at"/></td>
                            <td><xsl:value-of select="due_date"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>