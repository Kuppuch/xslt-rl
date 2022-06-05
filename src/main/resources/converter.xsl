<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <body>
                <h2>Задачи</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>ID</th>
                        <th>Задача</th>
                        <th>Описание</th>
                        <th>Статус</th>
                        <th>Исполнитель</th>
                        <th>Автор</th>
                        <th>Дата начала</th>
                        <th>Дата конца</th>
                        <th>Приоритетность</th>
                    </tr>
                    <xsl:for-each select="Project/IssueList/Issue">
                        <tr>
                            <td><xsl:value-of select="generate-id()"/></td>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="description"/></td>
                            <xsl:choose>
                                <xsl:when test="status = 'Готово'">
                                    <td bgcolor="#a5e327"><xsl:value-of select="status"/></td>
                                </xsl:when>
                                <xsl:when test="status = 'В работе'">
                                    <td bgcolor="#27a7e3"><xsl:value-of select="status"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td><xsl:value-of select="status"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td><xsl:value-of select="assigned_to/name"/><xsl:text> </xsl:text><xsl:value-of select="assigned_to/lastname"/></td>
                            <td><xsl:value-of select="author/name"/><xsl:text> </xsl:text><xsl:value-of select="author/lastname"/></td>
                            <td><xsl:value-of select="substring(start_at, 0, 11)"/></td>
                            <td><xsl:value-of select="substring(due_date, 0, 11)"/></td>
                            <td><xsl:value-of select="priority"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td>Всего задач</td>
                        <xsl:variable name="count" select="count(Project/IssueList/Issue)"/>
                        <td><xsl:value-of select="$count"/></td>
                    </tr>
                </table>
                <h1>Детализация по задачам</h1>
                <xsl:for-each select="Project/IssueList/Issue">
                    <h3>Задача <xsl:value-of select="name"/></h3>
                    <table border="1">
                        <tr bgcolor="#9acd32">
                            <td>Описание задачи</td>
                            <td>ТЗ</td>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="description"/></td>
                            <td><xsl:value-of select="SrsBlock/Content/Value"/></td>
                        </tr>
                    </table>
                </xsl:for-each>


            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>