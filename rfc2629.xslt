<!--
    XSLT transformation from RFC2629 XML format to HTML

    Copyright (c) 2001-2005 Julian F. Reschke (julian.reschke@greenbytes.de)

    placed into the public domain

    change history:

    2001-03-28  julian.reschke@greenbytes.de

    Code rearranged, generate numbered section anchors for paragraphs (t)
    as well. Fixes in index handling.

    2001-04-12  julian.reschke@greenbytes.de

    Moved HTML output into XHTML namespace.

    2001-10-02  julian.reschke@greenbytes.de

    Fixed default location for RFCs and numbering of section references.
    Support ?rfc editing processing instruction.

    2001-10-07  julian.reschke@greenbytes.de

    Made telephone number links active.

    2001-10-08  julian.reschke@greenbytes.de

    Support for vspace element.

    2001-10-09  julian.reschke@greenbytes.de

    Experimental support for rfc-issue PI.

    2001-11-11  julian.reschke@greenbytes.de

    Support rfc private PI. Removed bogus code reporting the WG in the header.

    2001-12-17  julian.reschke@greenbytes.de

    Support title attribute on references element

    2002-01-05  julian.reschke@greenbytes.de

    Support for list/@style="@format"

    2002-01-09  julian.reschke@greenbytes.de

    Display "closed" RFC issues as deleted

    2002-01-14  julian.reschke@greenbytes.de

    Experimentally and optionally parse XML encountered in artwork elements
    (requires MSXSL).

    2002-01-27  julian.reschke@greenbytes.de

    Some cleanup. Moved RFC issues from PIs into namespaced elements.

    2002-01-29  julian.reschke@greenbytes.de

    Added support for sortrefs PI. Added support for figure names.

    2002-02-07  julian.reschke@greenbytes.de

    Highlight parts of artwork which are too wide (72 characters).

    2002-02-12  julian.reschke@greenbytes.de

    Code rearrangement for static texts. Fixes for section numbering.
    TOC generation rewritten.

    2002-02-15  julian.reschke@greenbytes.de

    Support for irefs in sections; support iref @primary=true

    2002-03-03  julian.reschke@greenbytes.de

    Moved anchor prefix into a constant. Added sanity checks on user anchor
    names.

    2002-03-23  julian.reschke@greenbytes.de

    Bugfix in detection of matching org names when creating the header. Fixed
    sorting in subitems.

    2002-04-02  julian.reschke@greenbytes.de

    Fix TOC link HTML generation when no TOC is generated (created broken
    HTML table code).

    2002-04-03  julian.reschke@greenbytes.de

    Made rendering of references more tolerant re: missing parts.

    2002-04-08  julian.reschke@greenbytes.de

    Fixed reference numbering when references are split into separate sections.

    2002-04-16  julian.reschke@greenbytes.de

    Fix default namespace (shouldn't be set for HTML output method).

    2002-04-19  julian.reschke@greenbytes.de

    Lowercase internal CSS selectors for Mozilla compliance. Do not put TOC
    into ul element.

    2002-04-21  julian.reschke@greenbytes.de

    Make numbered list inside numbered lists use alphanumeric numbering.

    2002-05-05  julian.reschke@greenbytes.de

    Updated issue/editing support.

    2002-05-15  julian.reschke@greenbytes.de

    Bugfix for section numbering after introduction of ed:replace

    2002-06-21  julian.reschke@greenbytes.de

    When producing private documents, do not include document status, copyright etc.

    2002-07-08  julian.reschke@greenbytes.de

    Fix xrefs to Appendices.

    2002-07-19  fielding

    Make artwork lightyellow for easier reading.

    2002-10-09  fielding

    Translate references title to anchor name to avoid non-uri characters.
    
    2002-10-13  julian.reschke@greenbytes.de
    
    Support for tocdepth PI.

    2002-11-03  julian.reschke@greenbytes.de
    
    Added temporariry workaround for Mozilla/Transformiix result tree fragment problem.
    (search for 'http://bugzilla.mozilla.org/show_bug.cgi?id=143668')
    
    2002-12-25  julian.reschke@greenbytes.de
    
    xref code: attempt to uppercase "section" and "appendix" when at the start
    of a sentence.
    
    2003-02-02  julian.reschke@greenbytes.de
    
    fixed code for vspace blankLines="0", enhanced display for list with "format" style,
    got rid of HTML blockquote elements, added support for "hangIndent"
    
    2003-04-10  julian.reschke@greenbytes.de
    
    experimental support for appendix and spanx elements
    
    2003-04-19  julian.reschke@greenbytes.de
    
    fixed counting of list numbers in "format %" styles (one counter
    per unique format string). Added more spanx styles.

    2003-05-02  julian.reschke@greenbytes.de
    
    experimental texttable support
    
    2003-05-02  fielding 
    
    Make mailto links optional (default = none) (jre: default and PI name changed)

    2003-05-04  julian.rechke@greenbytes.de
    
    experimental support for HTML link elements; fix default for table header
    alignment default

    2003-05-06  julian.rechke@greenbytes.de
    
    support for "background" PI.
    
    2003-05-11  julian.reschke@greenbytes.de
    
    change %c format to lowercase alphabetic. add support for keyword
    elements (generate META tag). fix various HTML conformance problems.
    added experimental support for role attribute. do not number paragraphs
    in unnumbered sections. update boilerplate texts. support for
    "iprnotified" PI. bugfix list numbering. strip whitespace when
    building tel: URIs.
    
    2003-05-12  julian.reschke@greenbytes.de
  
    more conformance fixes (layout moved into CSS, move lists and figures
    out of para content, do not use tables for list formatting)
    
    2003-05-13  julian.reschke@greenbytes.de
  
    add DC.Creator meta tag, refactoring

    2003-05-16  julian.reschke@greenbytes.de
  
    put nbsps between "section" and section number (xref).

    2003-05-18  julian.reschke@greenbytes.de
  
    author summary: add missing comma.
    
    2003-06-06  julian.reschke@greenbytes.de
    
    fix index generation bug (transposed characters in key generation). Enhance
    sentence start detection (xref starting a section was using lowercase
    "section").
    
    2003-06-22  julian.reschke@greenbytes.de
    
    exp. support for xref/@format. Add missing support for eref w/o content.
    exp. support for annotations in reference elements. Code cleanup
    reference table formatting.
    
    2003-07-09  julian.reschke@greenbytes.de
    
    Another fix for DC.Creator meta tag creation based on RFC2731

    2003-07-24  julian.reschke@greenbytes.de
    
    Fix namespace name for DC.Creator.
    
    2003-08-06  julian.reschke@greenbytes.de
    
    Cleanup node-set support (only use exslt (saxon, xalan, libxslt) extension
    functions; remove Transformix workarounds that stopped to work in Moz 1.4)

    2003-08-09  julian.reschke@greenbytes.de
    
    Generate HTML lang tag.
    
    2003-08-10  julian.reschke@greenbytes.de
    
    Map spanx/verb to HTML "samp" element. Fix author name display in
    references (reverse surname/initials for last author), add "Ed.".
    Fix internal bookmark generation.
    
    2003-08-17  julian.reschke@greenbytes.de
    
    Add DCMI dates, identifiers and abstract. Add PI to suppress DCMI
    generation.  Do not add TOC entry to Copyright Statement when there is
    none. Align RFC2629 PI names and parameter names. Change style for
    inline URIs generated by eref. Add header and footer support.
    Enhance CSS paging properties. Support topblock PI. Added hooks for
    proper XHTML generation through separate XSLT. Enhance warning and
    error messages. Add support for artwork image display. Table formatting
    fixes (borders, thead continuation).

    2003-08-18  julian.reschke@greenbytes.de
    
    Add workaround for MSXML4 node-set and Mozilla node-set issues (fallback
    just displays are warning).
    
    2003-10-06  julian.reschke@greenbytes.de
    
    Add workaround for broken pre/ins handling in Mozilla
    (see <http://bugzilla.mozilla.org/show_bug.cgi?id=204401>). Make use
    of cite attribute on ed:replace. CSS cleanup.
    
    2003-10-08  julian.reschke@greenbytes.de
    
    Fix minor issue detecting the same org for the header (caused by IE's
    non-standard whitespace handling). Fix default handling for /rfc/@category.
    
    2003-11-09  julian.reschke@greenbytes.de
    
    Inherit ed:entered-by from ancestor elements. Change CSS color for inserted
    text to green. Generate issues-list anchor. Do not complain about missing
    targets when the xref element is below ed:del. Remove code that attempted
    to distinguish section/Section when producing links - always use
    uppercase. Fix date rendering for issue resolutions.

    2003-11-29  julian.reschke@greenbytes.de
    
    Fix color values for table backgrounds for issue rendering. Change
    rendering of issue links to use inline-styles. Add colored issue markers to
    issues. 

    2003-12-13  julian.reschke@greenbytes.de
    
    Fix inheritance of ed:entered-by attribute. Display note elements inside
    change tracking as well.
    
    2004-01-18  julian.reschke@greenbytes.de
    
    When PI compact = 'yes', make most CSS print page breaks conditional.

    2004-02-20  julian.reschke@greenbytes.de
    
    Support for RFC3667 IPR changes (xml2rfc 1.22); see
    <http://lists.xml.resource.org/pipermail/xml2rfc/2004-February/001088.html>.
    
    2004-03-11  julian.reschke@greenbytes.de
    
    Add "(if approved)" to "updates" and "obsoletes" unless the document has
    an RFC number.
    
    2004-04-01  julian.reschke@greenbytes.de
    
    Fix RFC3667 output, see <http://lists.xml.resource.org/pipermail/xml2rfc/2004-April/001208.html>

    2004-04-04  julian.reschke@greenbytes.de
    
    Add support for section/top attribute. Move references into plain
    section container.
    
    2004-04-06  julian.reschke@greenbytes.de
    
    Do not emit identical para anchors for deleted content.
    
    2004-04-14  julian.reschke@greenbytes.de
    
    Fix references TOC generation when there are no references.

    2004-04-24  julian.reschke@greenbytes.de
    
    Fix RFC3667 output, see <http://xml.resource.org/pipermail/xml2rfc/2004-April/001246.html>

    2004-05-09  julian.reschke@greenbytes.de
    
    Add custom support for generating compound index documents. Add anchors
    for each Index letter. Add experimental cref support. Fix conditional page
    breaks before References section.
    
    2004-05-16  julian.reschke@greenbytes.de
    
    Refactor external index generation.
    
    2004-05-20  julian.reschke@greenbytes.de
    
    Rewrite anchor generation for comments.

    2004-05-22  julian.reschke@greenbytes.de
    
    Enhance issues rendering (add links to changes).
    
    2004-05-30  julian.reschke@greenbytes.de
    
    Allow single quote as delimiter in processing instructions as well. Move
    block-level issue pointers to floats. Disable issue pointers for print
    media. Add "purple numbers". Add hrefs to section headings. Add non-printing
    index key letter list to start of index.

    2004-06-01  julian.reschke@greenbytes.de
    
    Use &#xb6; instead of # for PNs.
    
    2004-07-18  julian.reschke@greenbytes.de
    
    Add support for list style=letters (thanks Roy F.). Make PNs optional;
    add new PI.

    2004-09-05  julian.reschke@greenbytes.de
    
    Fix index links into unnumbered sections.  Bring IPR boilerplate in-line
    with xml2rfc 1.25.  Add experimental CSS3 paged media support.  Various
    HTML fixes.
    
    2004-09-21  julian.reschke@greenbytes.de
    
    Enhance checking of artwork width.
    
    2004-09-26  julian.reschke@greenbytes.de

    Add check for unused references. Uppercase letters in list style letters
    when nested into another list.

    2004-10-10  julian.reschke@greenbytes.de

    Fix internal change track pointers.
    
    2004-11-01  julian.reschke@greenbytes.de
    
    Allow change tracking on references (as a whole).  Rewrite artwork handling
    so that it allows change tracking inside artwork.  Also allow a subset of
    text markup inside artwork, such as xrefs (note this requires post-
    processing the source to make it compliant to RFC2629bis).
    
    2004-11-03  julian.reschke@greenbytes.de
    
    Enhanced placement of iref anchors.

    2004-11-06  julian.reschke@greenbytes.de
    
    Index: display irefs that appeared (with primary=true) inside artwork elements
    in a monospaced font.
    
    2004-11-14  julian.reschke@greenbytes.de
    
    Add special code so that changes in section titles can be change-tracked.

    2005-01-14  julian.reschke@greenbytes.de
    
    Bugfixes for HtmlToXhtml converter.

    2005-01-22  julian.reschke@greenbytes.de
    
    Enhance generation of HTML h* elements (for Mozilla Outliner).

    2005-01-31  julian.reschke@greenbytes.de
    
    Put vertical space around top-level TOC entries in TOC.  Switch to
    pt-based CSS. Re-arrange top section. Make hr elements reflect new-page
    settings in TXT output (compact-PI).  Fix page number in footer (CSS
    print) and add some more experimental support for paged media (tested
    with Prince 4.1 alpha).  Rewrite TOC and Index generation to generate HTML
    lists.  Cleanup id generation for paragraphs.  Reduce whitespace in output.
    Fix vspace implementation. Use right/left dqoutes and copyright sign
    where appropriate.
    
    2005-02-04  julian.reschke@greenbytes.de
    
    Add <link> element to references section.  Fix newly introduced bug
    in references processing.
    
    2005-02-05  julian.reschke@greenbytes.de
   
    Integrate various fixes/enhancements by Roy Fielding: spelling of
    "Authors' Addresses", comma setting in references, position of "Authors"
    section, optionally place authors addresses at end (PI), trailing dots
    in section numbers, switch to verdana default font in CSS.  Add
    experimental support for centered artwork.
    
    2005-02-09  julian.reschke@greenbytes.de

    Fixes in spacing and links of references section titles.  Enhance sorting
    in references when change tracking is in place.  Re-add figure centering
    support.  Add missing 2nd part of "Author's Adresses" fix. 

    2005-02-25  julian.reschke@greenbytes.de

    Align section number format with xml2rfc1.29.
    
    2005-03-28  julian.reschke@greenbytes.de
    
    Get rid of table elements in Author's section.  Add experimental hCard
    (<http://developers.technorati.com/wiki/hCard>) support.
    
    2005-04-03  fenner@research.att.com
    
    Add RFC3978-style IPR statement support.

    2005-04-11  julian.reschke@greenbytes.de
    
    Cleanup author display. hCard related fixes.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:exslt="http://exslt.org/common"
                xmlns:myns="mailto:julian.reschke@greenbytes.de?subject=rcf2629.xslt"
                xmlns:ed="http://greenbytes.de/2002/rfcedit"

                exclude-result-prefixes="msxsl exslt myns ed"
                >

<xsl:strip-space elements="back front list middle rfc section"/>                
                
<!--
<xsl:output method="html" encoding="iso-8859-1" version="4.0" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="no"/>
-->
<xsl:output method="xhtml" encoding="UTF-8"/>

<!-- process some of the processing instructions supported by Marshall T. Rose's
     xml2rfc sofware, see <http://xml.resource.org/> -->

<!-- delimiters in PIs -->
<xsl:variable name="quote-chars">"'</xsl:variable>     
     
<!-- rfc comments PI -->

<xsl:param name="xml2rfc-comments"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'comments=')], concat($quote-chars,' '), ''),
        'comments=')"
/>

<!-- rfc compact PI -->

<xsl:param name="xml2rfc-compact"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'compact=')], concat($quote-chars,' '), ''),
        'compact=')"
/>

<!-- rfc footer PI -->

<xsl:param name="xml2rfc-footer"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'footer=')], concat($quote-chars,' '), ''),
        'footer=')"
/>

<!-- rfc header PI -->

<xsl:param name="xml2rfc-header"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'header=')], concat($quote-chars,' '), ''),
        'header=')"
/>

<!-- rfc inline PI -->

<xsl:param name="xml2rfc-inline"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'inline=')], concat($quote-chars,' '), ''),
        'inline=')"
/>

<!-- include a table of contents if a processing instruction <?rfc?>
     exists with contents toc="yes". Can be overriden by an XSLT parameter -->

<xsl:param name="xml2rfc-toc"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'toc=')], concat($quote-chars,' '), ''),
        'toc=')"
/>

<!-- optional tocdepth-->

<xsl:param name="xml2rfc-tocdepth"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'tocdepth=')], concat($quote-chars,' '), ''),
        'tocdepth=')"
/>

<xsl:variable name="parsedTocDepth">
  <xsl:choose>
    <xsl:when test="$xml2rfc-tocdepth='1'">1</xsl:when>
    <xsl:when test="$xml2rfc-tocdepth='2'">2</xsl:when>
    <xsl:when test="$xml2rfc-tocdepth='3'">3</xsl:when>
    <xsl:when test="$xml2rfc-tocdepth='4'">4</xsl:when>
    <xsl:when test="$xml2rfc-tocdepth='5'">5</xsl:when>
    <xsl:otherwise>99</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- suppress top block if a processing instruction <?rfc?>
     exists with contents tocblock="no". Can be overriden by an XSLT parameter -->

<xsl:param name="xml2rfc-topblock"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'topblock=')], concat($quote-chars,' '), ''),
        'topblock=')"
/>

<!-- use symbolic reference names instead of numeric ones if a processing instruction <?rfc?>
     exists with contents symrefs="yes". Can be overriden by an XSLT parameter -->

<xsl:param name="xml2rfc-symrefs"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'symrefs=')], concat($quote-chars,' '), ''),
        'symrefs=')"
/>

<!-- sort references if a processing instruction <?rfc?>
     exists with contents sortrefs="yes". Can be overriden by an XSLT parameter -->

<xsl:param name="xml2rfc-sortrefs"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'sortrefs=')], concat($quote-chars,' '), ''),
        'sortrefs=')"
/>

<!-- insert editing marks if a processing instruction <?rfc?>
     exists with contents editing="yes". Can be overriden by an XSLT parameter -->

<xsl:param name="xml2rfc-editing"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'editing=')], concat($quote-chars,' '), ''),
        'editing=')"
/>

<!-- make it a private paper -->

<xsl:param name="xml2rfc-private"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'private=')], concat($quote-chars,' '), ''),
        'private=')"
/>

<!-- background image? -->

<xsl:param name="xml2rfc-background"
  select="substring-after(
      translate(/processing-instruction('rfc')[contains(.,'background=')], $quote-chars, ''),
        'background=')"
/>

<!-- extension for XML parsing in artwork -->

<xsl:param name="xml2rfc-ext-parse-xml-in-artwork"
  select="substring-after(
      translate(/processing-instruction('rfc-ext')[contains(.,'parse-xml-in-artwork=')], concat($quote-chars,' '), ''),
        'parse-xml-in-artwork=')"
/>

<!-- extension for excluding DCMI properties in meta tag (RFC2731) -->

<xsl:param name="xml2rfc-ext-support-rfc2731"
  select="substring-after(
      translate(/processing-instruction('rfc-ext')[contains(.,'support-rfc2731=')], concat($quote-chars,' '), ''),
        'support-rfc2731=')"
/>

<!-- extension for allowing markup inside artwork -->

<xsl:param name="xml2rfc-ext-allow-markup-in-artwork"
  select="substring-after(
      translate(/processing-instruction('rfc-ext')[contains(.,'allow-markup-in-artwork=')], concat($quote-chars,' '), ''),
        'allow-markup-in-artwork=')"
/>

<!-- position of author's section -->

<xsl:param name="xml2rfc-ext-authors-section"
  select="substring-after(
      translate(/processing-instruction('rfc-ext')[contains(.,'authors-section=')], concat($quote-chars,' '), ''),
        'authors-section=')"
/>

<!-- trailing dots in section numbers -->

<xsl:param name="xml2rfc-ext-sec-no-trailing-dots"
  select="substring-after(
      translate(/processing-instruction('rfc-ext')[contains(.,'sec-no-trailing-dots=')], concat($quote-chars,' '), ''),
        'sec-no-trailing-dots=')"
/>

<!-- choose whether or not to do mailto links --> 
  
 <xsl:param name="xml2rfc-linkmailto" 
   select="substring-after( 
       translate(/processing-instruction('rfc')[contains(.,'linkmailto=')], concat($quote-chars,' '), ''), 
         'linkmailto=')" 
 /> 


<!-- iprnotified switch --> 
  
 <xsl:param name="xml2rfc-iprnotified" 
   select="substring-after( 
       translate(/processing-instruction('rfc')[contains(.,'iprnotified=')], concat($quote-chars,' '), ''), 
         'iprnotified=')" 
 /> 


<!-- URL prefix for RFCs. -->

<xsl:param name="rfcUrlPrefix" select="'http://www.ietf.org/rfc/rfc'" />

<!-- warning re: absent node-set ext. function -->
<xsl:variable name="node-set-warning">
  This stylesheet requires either an XSLT-1.0 processor with node-set()
  extension function, or an XSLT-2.0 processor. Therefore, parts of the
  document couldn't be displayed.
</xsl:variable>

<!-- build help keys for indices -->
<xsl:key name="index-first-letter"
  match="iref"
    use="translate(substring(@item,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

<xsl:key name="index-item"
  match="iref"
    use="@item" />

<xsl:key name="index-item-subitem"
  match="iref"
    use="concat(@item,'..',@subitem)" />

<!-- character translation tables -->
<xsl:variable name="lcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="ucase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />       

<xsl:variable name="plain" select="' #/ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
<xsl:variable name="touri" select="'___abcdefghijklmnopqrstuvwxyz'" />

<!-- prefix for automatically generated anchors -->
<xsl:variable name="anchor-prefix" select="'rfc'" />

<!-- IPR version switch -->
<xsl:variable name="ipr-rfc3667" select="(/rfc/@number &gt; 3708) or not((/rfc/@ipr = 'full2026') or 
  (/rfc/@ipr = 'noDerivativeWorks2026') or (/rfc/@ipr = 'noDerivativeWorksNow') or (/rfc/@ipr = 'none'))" />

          
<!-- Templates for the various elements of rfc2629.dtd -->
              
<xsl:template match="text()[not(ancestor::artwork)]">
  <xsl:variable name="starts-with-ws" select="translate(substring(.,1,1),'&#9;&#10;&#13;&#32;','')"/>
  <xsl:variable name="ends-with-ws" select="translate(substring(.,string-length(.),1),'&#9;&#10;&#13;&#32;','')"/>
  <!--<xsl:message> Orig: "<xsl:value-of select="."/>"</xsl:message>
  <xsl:message>Start: "<xsl:value-of select="$starts-with-ws"/>"</xsl:message>
  <xsl:message>  End: "<xsl:value-of select="$ends-with-ws"/>"</xsl:message> -->
  <xsl:if test="$starts-with-ws='' and preceding-sibling::node()">
    <xsl:text> </xsl:text>
  </xsl:if>
  <xsl:value-of select="normalize-space(.)"/>
  <xsl:if test="$ends-with-ws='' and following-sibling::node()">
    <xsl:text> </xsl:text>
  </xsl:if>
</xsl:template>
              
              
<xsl:template match="abstract">
  <h1 id="{$anchor-prefix}.abstract"><a href="#{$anchor-prefix}.abstract">Abstract</a></h1>
  <xsl:apply-templates />
</xsl:template>

<msxsl:script language="JScript" implements-prefix="myns">
  function parseXml(str) {
    var doc = new ActiveXObject ("MSXML2.DOMDocument");
    doc.async = false;
    if (doc.loadXML (str)) return "";
    return doc.parseError.reason + "\n" + doc.parseError.srcText + " (" + doc.parseError.line + "/" + doc.parseError.linepos + ")";
  }
</msxsl:script>

<xsl:template match="artwork">
  <xsl:if test="not(ancestor::ed:del) and $xml2rfc-ext-parse-xml-in-artwork='yes' and function-available('myns:parseXml')">
    <xsl:if test="contains(.,'&lt;?xml')">
      <xsl:variable name="body" select="substring-after(substring-after(.,'&lt;?xml'),'?>')" /> 
      <xsl:if test="$body!='' and myns:parseXml($body)!=''">
        <table style="background-color: red; border-width: thin; border-style: solid; border-color: black;">
        <tr><td>
        XML PARSE ERROR:
        <pre><xsl:value-of select="myns:parseXml($body)" /></pre>
        </td></tr></table>
      </xsl:if>
    </xsl:if>
    <xsl:if test="@ed:parse-xml-after">
      <xsl:if test="myns:parseXml(string(.))!=''">
        <table style="background-color: red; border-width: thin; border-style: solid; border-color: black;">
        <tr><td>
        XML PARSE ERROR:
        <pre><xsl:value-of select="myns:parseXml(string(.))" /></pre>
        </td></tr></table>
      </xsl:if>
    </xsl:if>
  </xsl:if>
  <xsl:variable name="display">
    <xsl:choose>
      <xsl:when test="$xml2rfc-ext-allow-markup-in-artwork='yes'">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>  
  <xsl:choose>
    <xsl:when test="@align='right'">
      <div style="display:table; margin-left: auto; margin-right: 0pt; width: 0pt;">
        <pre style="margin-left: 0em;">
          <xsl:copy-of select="$display"/>
        </pre>          
      </div>
    </xsl:when>
    <xsl:when test="@align='center'">
      <div style="display:table; margin-left: auto; margin-right: auto; width: 0pt;">
        <pre style="margin-left: 0em;">
          <xsl:copy-of select="$display"/>
        </pre>          
      </div>
    </xsl:when>
    <xsl:otherwise>
      <pre>
        <xsl:copy-of select="$display"/>
      </pre>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:call-template name="check-artwork-width">
    <xsl:with-param name="content"><xsl:apply-templates/></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="check-artwork-width">
  <xsl:param name="content"/>
  <xsl:choose>
    <xsl:when test="not(contains($content,'&#10;'))">
      <xsl:if test="string-length($content) > 69">
        <xsl:message>artwork line too long: <xsl:value-of select="$content"/></xsl:message>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="start" select="substring-before($content,'&#10;')"/> 
      <xsl:variable name="end" select="substring-after($content,'&#10;')"/> 
      <xsl:if test="string-length($start) > 69">
        <xsl:message>artwork line too long: <xsl:value-of select="$start"/></xsl:message>
      </xsl:if>
      <xsl:call-template name="check-artwork-width">
        <xsl:with-param name="content" select="$end"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="artwork[@src and starts-with(@type,'image/')]">
  <img src="{@src}" alt="{.}">
    <xsl:copy-of select="@width|@height"/>
  </img>
</xsl:template>

<xsl:template match="author">

    <address class="vcard">
      <span class="vcardline">
        <span class="fn">
          <xsl:value-of select="@fullname" />
        </span>
        <xsl:if test="@role">
          (<xsl:value-of select="@role" />)
        </xsl:if>
        <!-- components of name (hidden from display -->
        <span class="n" style="display: none">
          <span class="Family-Name"><xsl:value-of select="@surname"/></span>
          <!-- given-name family-name -->
          <xsl:if test="@surname=substring(@fullname,1 + string-length(@fullname) - string-length(@surname))">
            <span class="Given-Name"><xsl:value-of select="normalize-space(substring(@fullname,1,string-length(@fullname) - string-length(@surname)))"/></span>
          </xsl:if>
          <!-- family-name given-name -->
          <xsl:if test="starts-with(@fullname,@surname)">
            <span class="Given-Name"><xsl:value-of select="normalize-space(substring-after(@fullname,@surname))"/></span>
          </xsl:if>
        </span>
      </span>
      <span class="org vcardline">
        <xsl:value-of select="organization" />
      </span>
      <span class="adr vcardline">
        <xsl:if test="address/postal/street!=''">
          <span class="street Street-Address vcardline">
            <xsl:for-each select="address/postal/street">
              <xsl:value-of select="." />
            </xsl:for-each>
          </span>
        </xsl:if>
        <xsl:if test="address/postal/city|address/postal/region|address/postal/code">
          <span class="vcardline">
            <xsl:if test="address/postal/city"><span class="Locality"><xsl:value-of select="address/postal/city" /></span>, </xsl:if>
            <xsl:if test="address/postal/region"><span class="Region"><xsl:value-of select="address/postal/region" /></span>&#160;</xsl:if>
            <xsl:if test="address/postal/code"><span class="Postal-Code"><xsl:value-of select="address/postal/code" /></span></xsl:if>
          </span>
        </xsl:if>
        <xsl:if test="address/postal/country">
          <span class="Country vcardline"><xsl:value-of select="address/postal/country" /></span>
        </xsl:if>
      </span>
      <xsl:if test="address/phone">
        <span class="vcardline">
          <xsl:text>Phone: </xsl:text>
          <a href="tel:{translate(address/phone,' ','')}"><span class="tel"><span class="voice"><xsl:value-of select="address/phone" /></span></span></a>
        </span>
      </xsl:if>
      <xsl:if test="address/facsimile">
        <span class="vcardline">
          <xsl:text>Fax: </xsl:text>
          <a href="fax:{translate(address/facsimile,' ','')}"><span class="tel"><span class="fax"><xsl:value-of select="address/facsimile" /></span></span></a>
        </span>
      </xsl:if>
      <xsl:if test="address/email">
        <span class="vcardline">
        <xsl:text>EMail: </xsl:text>
        <a>
          <xsl:if test="$xml2rfc-linkmailto!='no'">
            <xsl:attribute name="href">mailto:<xsl:value-of select="address/email" /></xsl:attribute>
          </xsl:if>
          <span class="email"><xsl:value-of select="address/email" /></span>
        </a>
        </span>
      </xsl:if>
      <xsl:if test="address/uri">
        <span class="vcardline">
          <xsl:text>URI: </xsl:text>
          <a href="{address/uri}" class="url"><xsl:value-of select="address/uri" /></a>
        </span>
      </xsl:if>
    </address>

</xsl:template>

<xsl:template match="back">

  <!-- add references section first, no matter where it appears in the
    source document -->
  <!-- as of April 2004, process from middle section 
  <xsl:apply-templates select="references" />
  -->
  
  <!-- add editorial comments -->
  <xsl:if test="//cref and $xml2rfc-comments='yes' and $xml2rfc-inline!='yes'">
    <xsl:call-template name="insertComments" />
  </xsl:if>
  
  <!-- next, add information about the document's authors -->
  <xsl:if test="$xml2rfc-ext-authors-section!='end'">
    <xsl:call-template name="insertAuthors" />
  </xsl:if>
     
  <!-- add all other top-level sections under <back> -->
  <xsl:apply-templates select="*[not(self::references)]" />

  <xsl:if test="$xml2rfc-ext-authors-section='end'">
    <xsl:call-template name="insertAuthors" />
  </xsl:if>

  <xsl:if test="not($xml2rfc-private)">
    <!-- copyright statements -->
    <xsl:variable name="copyright"><xsl:call-template name="insertCopyright" /></xsl:variable>
  
    <!-- emit it -->
    <xsl:choose>
      <xsl:when test="function-available('msxsl:node-set')">
        <xsl:apply-templates select="msxsl:node-set($copyright)" />
      </xsl:when>
      <xsl:when test="function-available('exslt:node-set')">
        <xsl:apply-templates select="exslt:node-set($copyright)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:message><xsl:value-of select="$node-set-warning"/></xsl:message>
        <p class="error"><xsl:value-of select="$node-set-warning"/></p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  
  <!-- insert the index if index entries exist -->
  <xsl:if test="//iref">
    <xsl:call-template name="insertIndex" />
  </xsl:if>

</xsl:template>

<xsl:template match="eref[node()]">
  <a href="{@target}"><xsl:apply-templates /></a>
</xsl:template>
               
<xsl:template match="eref[not(node())]">
  <xsl:text>&lt;</xsl:text>
  <a href="{@target}"><xsl:value-of select="@target" /></a>
  <xsl:text>&gt;</xsl:text>
</xsl:template>

<xsl:template match="figure">
  <xsl:if test="@anchor!=''">
    <div id="{@anchor}"/>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="@title!='' or @anchor!=''">
      <xsl:variable name="n"><xsl:number level="any" count="figure[@title!='' or @anchor!='']" /></xsl:variable>
      <div id="{$anchor-prefix}.figure.{$n}" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="n"><xsl:number level="any" count="figure[not(@title!='' or @anchor!='')]" /></xsl:variable>
      <div id="{$anchor-prefix}.figure.u.{$n}" />
    </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates />
  <xsl:if test="@title!='' or @anchor!=''">
    <xsl:variable name="n"><xsl:number level="any" count="figure[@title!='' or @anchor!='']" /></xsl:variable>
    <p class="figure">Figure <xsl:value-of select="$n"/><xsl:if test="@title!=''">: <xsl:value-of select="@title" /></xsl:if></p>
  </xsl:if>
</xsl:template>

<xsl:template match="front">
  
  <xsl:if test="$xml2rfc-topblock!='no'">
    <!-- collect information for left column -->
      
    <xsl:variable name="leftColumn">
      <xsl:call-template name="collectLeftHeaderColumn" />    
    </xsl:variable>
  
    <!-- collect information for right column -->
      
    <xsl:variable name="rightColumn">
      <xsl:call-template name="collectRightHeaderColumn" />    
    </xsl:variable>
      
    <!-- insert the collected information -->
    <table summary="header information" class="header" border="0" cellpadding="1" cellspacing="1">
      <xsl:choose>
        <xsl:when test="function-available('msxsl:node-set')">
          <xsl:call-template name="emitheader">
            <xsl:with-param name="lc" select="msxsl:node-set($leftColumn)" />    
            <xsl:with-param name="rc" select="msxsl:node-set($rightColumn)" />    
          </xsl:call-template>
        </xsl:when>    
        <xsl:when test="function-available('exslt:node-set')">
          <xsl:call-template name="emitheader">
            <xsl:with-param name="lc" select="exslt:node-set($leftColumn)" />    
            <xsl:with-param name="rc" select="exslt:node-set($rightColumn)" />    
          </xsl:call-template>
        </xsl:when>    
        <xsl:otherwise>
          <xsl:message><xsl:value-of select="$node-set-warning"/></xsl:message>
          <p class="error"><xsl:value-of select="$node-set-warning"/></p>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:if>
    
  <p class="title">
    <br/>
    <!-- main title -->
    <xsl:value-of select="title"/>
    <xsl:if test="/rfc/@docName">
      <br/>
      <span class="filename"><xsl:value-of select="/rfc/@docName"/></span>
    </xsl:if>  
  </p>
  
  <xsl:if test="not($xml2rfc-private)">
    <!-- Get status info formatted as per RFC2629-->
    <xsl:variable name="preamble"><xsl:call-template name="insertPreamble" /></xsl:variable>
    
    <!-- emit it -->
    <xsl:choose>
      <xsl:when test="function-available('msxsl:node-set')">
        <xsl:apply-templates select="msxsl:node-set($preamble)" />
      </xsl:when>
      <xsl:when test="function-available('exslt:node-set')">
        <xsl:apply-templates select="exslt:node-set($preamble)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:message><xsl:value-of select="$node-set-warning"/></xsl:message>
        <p class="error"><xsl:value-of select="$node-set-warning"/></p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
            
  <xsl:apply-templates select="abstract" />
  <xsl:apply-templates select="note" />
  <!-- show notes inside change tracking as well -->
  <xsl:apply-templates select="ed:replace[.//note]" />
    
  <xsl:if test="$xml2rfc-toc='yes'">
    <xsl:apply-templates select="/" mode="toc" />
    <xsl:call-template name="insertTocAppendix" />
  </xsl:if>

</xsl:template>


<xsl:template match="iref">
  <xsl:variable name="anchor"><xsl:value-of select="$anchor-prefix"/>.iref.<xsl:number level="any"/></xsl:variable>
  <xsl:choose>
    <xsl:when test="ancestor::t|ancestor::figure">
      <a name="{$anchor}"/>
    </xsl:when>
    <xsl:otherwise>
      <div id="{$anchor}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- list templates depend on the list style -->

<xsl:template match="list[@style='empty' or not(@style)]">
  <dl>
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </dl>
</xsl:template>

<xsl:template match="list[starts-with(@style,'format ')]">
  <dl>
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </dl>
</xsl:template>

<xsl:template match="list[@style='hanging']">
  <dl>
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </dl>
</xsl:template>

<xsl:template match="list[@style='numbers']">
  <ol>
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </ol>
</xsl:template>

<!-- numbered list inside numbered list -->
<xsl:template match="list[@style='numbers']/t/list[@style='numbers']" priority="9">
  <ol style="list-style-type: lower-alpha">
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </ol>
</xsl:template>

<xsl:template match="list[@style='letters']">
  <ol style="list-style-type: lower-alpha">
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </ol>
</xsl:template>

<!-- nested lettered list uses uppercase -->
<xsl:template match="list//t//list[@style='letters']" priority="9">
  <ol style="list-style-type: upper-alpha">
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </ol>
</xsl:template>
   
<xsl:template match="list[@style='symbols']">
  <ul>
    <xsl:call-template name="insertInsDelClass"/>
    <xsl:apply-templates />
  </ul>
</xsl:template>


<!-- same for t(ext) elements -->

<xsl:template match="list[@style='empty' or not(@style)]/t">
  <dd style="margin-top: .5em">
    <xsl:apply-templates />
  </dd>
</xsl:template>

<xsl:template match="list[@style='numbers' or @style='symbols' or @style='letters']/t">
  <li>
    <xsl:apply-templates />
  </li>
</xsl:template>

<xsl:template match="list[@style='hanging']/t">
  <dt style="margin-top: .5em">
    <xsl:value-of select="@hangText" />
  </dt>
  <dd>
    <!-- if hangIndent present, use 0.7 of the specified value (1em is the width of the "m" character -->
    <xsl:if test="../@hangIndent and ../@hangIndent!='0'">
      <xsl:attribute name="style">margin-left: <xsl:value-of select="../@hangIndent * 0.7"/>em</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates />
  </dd>
</xsl:template>

<xsl:template match="list[starts-with(@style,'format ') and (contains(@style,'%c') or contains(@style,'%d'))]/t">
  <xsl:variable name="list" select=".." />
  <xsl:variable name="format" select="substring-after(../@style,'format ')" />
  <xsl:variable name="pos">
    <xsl:choose>
      <xsl:when test="$list/@counter">
        <xsl:number level="any" count="list[@counter=$list/@counter or (not(@counter) and @style=concat('format ',$list/@counter))]/t" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:number level="any" count="list[concat('format ',@counter)=$list/@style or (not(@counter) and @style=$list/@style)]/t" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <dt>
    <xsl:choose>
      <xsl:when test="contains($format,'%c')">
        <xsl:value-of select="substring-before($format,'%c')"/><xsl:number value="$pos" format="a" /><xsl:value-of select="substring-after($format,'%c')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring-before($format,'%d')"/><xsl:number value="$pos" format="1" /><xsl:value-of select="substring-after($format,'%d')"/>
      </xsl:otherwise>
    </xsl:choose>
  </dt>
  <dd>
    <xsl:apply-templates />
  </dd>
</xsl:template>

<xsl:template match="middle">
  <xsl:apply-templates />
  <xsl:apply-templates select="../back/references"/>
</xsl:template>

<xsl:template match="note">
  <xsl:variable name="num"><xsl:number/></xsl:variable>
  <h1 id="{$anchor-prefix}.note.{$num}"><a href="#{$anchor-prefix}.note.{$num}"/><xsl:value-of select="@title" /></h1>
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="postamble">
  <p>
    <xsl:call-template name="editingMark" />
    <xsl:apply-templates />
  </p>
</xsl:template>

<xsl:template match="preamble">
  <p>
    <xsl:call-template name="editingMark" />
    <xsl:apply-templates />
  </p>
</xsl:template>


<xsl:template match="reference">

  <!-- check for reference to reference -->
  <xsl:variable name="anchor" select="@anchor"/>
  <xsl:if test="not(//xref[@target=$anchor])">
    <xsl:message>WARNING: unused reference '<xsl:value-of select="@anchor"/>'</xsl:message>
  </xsl:if>

  <xsl:variable name="target">
    <xsl:choose>
      <xsl:when test="@target"><xsl:value-of select="@target" /></xsl:when>
      <xsl:when test="seriesInfo/@name='RFC'"><xsl:value-of select="concat($rfcUrlPrefix,seriesInfo[@name='RFC']/@value,'.txt')" /></xsl:when>
      <xsl:when test="seriesInfo[starts-with(.,'RFC')]">
        <xsl:variable name="rfcRef" select="seriesInfo[starts-with(.,'RFC')]" />
        <xsl:value-of select="concat($rfcUrlPrefix,substring-after (normalize-space($rfcRef), ' '),'.txt')" />
      </xsl:when>
      <xsl:otherwise />
    </xsl:choose>
  </xsl:variable>
  
  <tr>
    <td class="topnowrap">
      <xsl:call-template name="insertInsDelClass"/>
      <b>
        <a name="{@anchor}">
          <xsl:call-template name="referencename">
            <xsl:with-param name="node" select="." />
          </xsl:call-template>
        </a>
      </b>
    </td>
    
    <td class="top">
      <xsl:call-template name="insertInsDelClass"/>
      <xsl:for-each select="front/author">
        <xsl:choose>
          <xsl:when test="@surname and @surname!=''">
            <xsl:variable name="displayname">
              <!-- surname/initials is reversed for last author except when it's the only one -->
              <xsl:choose>
                <xsl:when test="position()=last() and position()!=1">
                  <xsl:value-of select="concat(@initials,' ',@surname)" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat(@surname,', ',@initials)" />
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="@role='editor'">
                <xsl:text>, Ed.</xsl:text>
              </xsl:if>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="address/email">
                <a>
                  <xsl:if test="$xml2rfc-linkmailto!='no'">
                    <xsl:attribute name="href">mailto:<xsl:value-of select="address/email" /></xsl:attribute>
                  </xsl:if>
                  <xsl:if test="organization/text()">
                    <xsl:attribute name="title"><xsl:value-of select="organization/text()"/></xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="$displayname" />
                </a>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$displayname" />
              </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
              <xsl:when test="position()=last() - 1">
                <xsl:if test="last() &gt; 2">,</xsl:if>
                <xsl:text> and </xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>, </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="organization/text()">
            <xsl:choose>
              <xsl:when test="address/uri">
                <a href="{address/uri}"><xsl:value-of select="organization" /></a>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="organization" />
              </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
              <xsl:when test="position()=last() - 1">
                <xsl:if test="last() &gt; 2">,</xsl:if>
                <xsl:text> and </xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>, </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise />
        </xsl:choose>
      </xsl:for-each>
         
      <xsl:choose>
        <xsl:when test="string-length($target) &gt; 0">
          <xsl:text>&#8220;</xsl:text><a href="{$target}"><xsl:value-of select="front/title" /></a><xsl:text>&#8221;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#8220;</xsl:text><xsl:value-of select="front/title" /><xsl:text>&#8221;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
            
      <xsl:for-each select="seriesInfo">
        <xsl:text>, </xsl:text>
        <xsl:choose>
          <xsl:when test="not(@name) and not(@value) and ./text()"><xsl:value-of select="." /></xsl:when>
          <xsl:otherwise><xsl:value-of select="@name" /><xsl:if test="@value!=''">&#0160;<xsl:value-of select="@value" /></xsl:if></xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      
      <xsl:if test="front/date/@year != '' and front/date/@year != '???'">
        <xsl:text>, </xsl:text>
        <xsl:if test="front/date/@month and front/date/@month!='???'"><xsl:value-of select="front/date/@month" />&#0160;</xsl:if>
        <xsl:value-of select="front/date/@year" />
      </xsl:if>
      
      <xsl:text>.</xsl:text>

      <xsl:for-each select="annotation">
        <br />
        <xsl:apply-templates />
      </xsl:for-each>

    </td>
  </tr>
  
  
</xsl:template>


<xsl:template match="references">

  <xsl:variable name="name">
    <xsl:number/>      
  </xsl:variable>

  <!-- insert pseudo section when needed -->
  <xsl:if test="$name='1' and count(/*/back/references)!=1">
    <xsl:call-template name="insert-conditional-hrule"/>
    <h1 id="{$anchor-prefix}.references">
      <xsl:call-template name="insert-conditional-pagebreak"/>
      <xsl:variable name="sectionNumber">
        <xsl:call-template name="get-references-section-number"/>
      </xsl:variable>
      <a name="{$anchor-prefix}.section.{$sectionNumber}" href="#{$anchor-prefix}.section.{$sectionNumber}">
        <xsl:call-template name="emit-section-number">
          <xsl:with-param name="no" select="$sectionNumber"/>
        </xsl:call-template>
      </a>
      <xsl:text> </xsl:text>
      <a href="#{$anchor-prefix}.references">References</a>
    </h1>
  </xsl:if>
  
  <xsl:variable name="elemtype">
    <xsl:choose>
      <xsl:when test="count(/*/back/references)!=1">h2</xsl:when>
      <xsl:otherwise>h1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:element name="{$elemtype}"> 
    <xsl:if test="$name='1'">
      <xsl:call-template name="insert-conditional-pagebreak"/>
    </xsl:if>
    <xsl:variable name="sectionNumber">
      <xsl:call-template name="get-section-number"/>
    </xsl:variable>
    <xsl:variable name="anchorpref">
      <xsl:choose>
        <xsl:when test="$elemtype='h1'"></xsl:when>
        <xsl:otherwise>.<xsl:value-of select="$name"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="id"><xsl:value-of select="concat($anchor-prefix,'.references',$anchorpref)"/></xsl:attribute>
    <a name="{$anchor-prefix}.references{$anchorpref}"/>
    <a href="#{$anchor-prefix}.section.{$sectionNumber}">
      <xsl:call-template name="emit-section-number">
        <xsl:with-param name="no" select="$sectionNumber"/>
      </xsl:call-template>
    </a>
    <xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="not(@title) or @title=''">References</xsl:when>
      <xsl:otherwise><xsl:value-of select="@title"/></xsl:otherwise>
    </xsl:choose>
  </xsl:element>
 
  <table summary="{@title}" border="0" cellpadding="2">
    <xsl:choose>
      <xsl:when test="$xml2rfc-sortrefs='yes'">
        <xsl:apply-templates>
          <xsl:sort select="@anchor|.//ed:ins//reference/@anchor" />
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </table>

</xsl:template>

<xsl:template match="rfc">
  
  <xsl:variable name="lang">
    <xsl:call-template name="get-lang" />
  </xsl:variable>

  <xhtml:html lang="{$lang}" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <link rel="neutron-introspection" type="application/neutron+xml" href="introspection-osr-101.xml"/>
      <title><xsl:value-of select="front/title" /></title>
      <style type="text/css" title="Xml2Rfc (sans serif)">
        <xsl:call-template name="insertCss" />
      </style>
      <!-- <link rel="alternate stylesheet" type="text/css" media="screen" title="Plain (typewriter)" href="rfc2629tty.css" /> -->
            
      <!-- link elements -->
      <xsl:if test="$xml2rfc-toc='yes'">
        <link rel="Contents" href="#{$anchor-prefix}.toc" />
      </xsl:if>
      <link rel="Author" href="#{$anchor-prefix}.authors" />
      <xsl:if test="not($xml2rfc-private)">
        <link rel="Copyright" href="#{$anchor-prefix}.copyright" />
      </xsl:if>
      <xsl:if test="//iref">
        <link rel="Index" href="#{$anchor-prefix}.index" />
      </xsl:if>
      <xsl:apply-templates select="/" mode="links" />
      <xsl:for-each select="/rfc/ed:link">
        <link><xsl:copy-of select="@*" /></link>
      </xsl:for-each>
      <xsl:if test="/rfc/@number">
        <link rel="Alternate" title="Authorative ASCII version" href="http://www.ietf.org/rfc/rfc{/rfc/@number}" />
      </xsl:if>

      <!-- generator -->
      <xsl:variable name="gen">
        <xsl:call-template name="get-generator" />
      </xsl:variable>
      <meta name="generator" content="{$gen}" />
      
      <!-- keywords -->
      <xsl:if test="front/keyword">
        <xsl:variable name="keyw">
          <xsl:call-template name="get-keywords" />
        </xsl:variable>
        <meta name="keywords" content="{$keyw}" />
      </xsl:if>

      <xsl:if test="$xml2rfc-ext-support-rfc2731!='no'">
        <!-- Dublin Core Metadata -->
        <link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
              
        <!-- DC creator, see RFC2731 -->
        <xsl:for-each select="/rfc/front/author">
          <meta name="DC.Creator" content="{concat(@surname,', ',@initials)}" />
        </xsl:for-each>
        
        <xsl:if test="not($xml2rfc-private)">
          <xsl:choose>
            <xsl:when test="/rfc/@number">
              <meta name="DC.Identifier" content="urn:ietf:rfc:{/rfc/@number}" />
            </xsl:when>
            <xsl:when test="/rfc/@docName">
              <meta name="DC.Identifier" content="urn:ietf:id:{/rfc/@docName}" />
            </xsl:when>
            <xsl:otherwise/>
          </xsl:choose>
          <xsl:variable name="month"><xsl:call-template name="get-month-as-num"/></xsl:variable>
          <meta name="DC.Date.Issued" scheme="ISO8601" content="{/rfc/front/date/@year}-{$month}" />
  
          <xsl:if test="/rfc/@obsoletes!=''">
            <xsl:call-template name="rfclist-for-dcmeta">
              <xsl:with-param name="list" select="/rfc/@obsoletes"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
  
        <xsl:if test="/rfc/front/abstract">
          <meta name="DC.Description.Abstract" content="{normalize-space(/rfc/front/abstract)}" />
        </xsl:if>      
      </xsl:if>      
    </head>
    <body>
      <!-- insert diagnostics -->
      <xsl:call-template name="insert-diagnostics"/>
    
      <xsl:apply-templates select="front" />
      <xsl:apply-templates select="middle" />
      <xsl:apply-templates select="back" />
    </body>
  </xhtml:html>
</xsl:template>               


<xsl:template match="t">
  <xsl:apply-templates mode="t-content" select="node()[1]" />
</xsl:template>

<!-- for t-content, dispatch to default templates if it's block-level content -->
<xsl:template mode="t-content" match="list|figure|texttable">
  <!-- <xsl:comment>t-content block-level</xsl:comment>  -->
  <xsl:apply-templates select="." />
  <xsl:apply-templates select="following-sibling::node()[1]" mode="t-content" />
</xsl:template>               
               
<!-- ... otherwise group into p elements -->
<xsl:template mode="t-content" match="*|node()">
  <xsl:variable name="p">
    <xsl:call-template name="get-paragraph-number" />
  </xsl:variable>

  <!-- do not open a new p element if this is a whitespace-only text node and no siblings follow -->  
  <xsl:if test="not(self::text() and normalize-space(.)='' and not(following-sibling::node()))">
    <p>
      <xsl:if test="string-length($p) &gt; 0 and not(ancestor::ed:del) and not(ancestor::ed:ins) and count(preceding-sibling::node())=0">
        <xsl:attribute name="id"><xsl:value-of select="$anchor-prefix"/>.section.<xsl:value-of select="$p"/></xsl:attribute>
      </xsl:if>
      <xsl:call-template name="insertInsDelClass"/>
      <xsl:call-template name="editingMark" />
      <xsl:apply-templates mode="t-content2" select="." />
    </p>
  </xsl:if>
  <xsl:apply-templates mode="t-content" select="following-sibling::*[self::list or self::figure or self::texttable][1]" />
</xsl:template>               
               
<xsl:template mode="t-content2" match="*">
  <xsl:apply-templates select="." />
  <xsl:if test="not(following-sibling::node()[1] [self::list or self::figure or self::texttable])">
    <xsl:apply-templates select="following-sibling::node()[1]" mode="t-content2" />
  </xsl:if>
</xsl:template>               

<xsl:template mode="t-content2" match="text()">
  <xsl:apply-templates select="." />
  <xsl:if test="not(following-sibling::node()[1] [self::list or self::figure or self::texttable])">
    <xsl:apply-templates select="following-sibling::node()[1]" mode="t-content2" />
  </xsl:if>
</xsl:template>               

<xsl:template name="insertTitle">
  <xsl:choose>
    <xsl:when test="@ed:old-title">
      <xsl:call-template name="insert-issue-pointer"/>
      <del>
        <xsl:if test="ancestor-or-self::*[@ed:entered-by] and @ed:datetime">
          <xsl:attribute name="title"><xsl:value-of select="concat(@ed:datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
        </xsl:if>
        <xsl:value-of select="@ed:old-title"/>
      </del>
      <ins>
        <xsl:if test="ancestor-or-self::*[@ed:entered-by] and @ed:datetime">
          <xsl:attribute name="title"><xsl:value-of select="concat(@ed:datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
        </xsl:if>
        <xsl:value-of select="@title"/>
      </ins>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="@title"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="section|appendix">

  <xsl:variable name="sectionNumber">
    <xsl:choose>
      <xsl:when test="@myns:unnumbered"></xsl:when>
      <xsl:otherwise><xsl:call-template name="get-section-number" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
    
  <xsl:if test="not(ancestor::section) and not(@myns:notoclink)">
    <xsl:call-template name="insert-conditional-hrule"/>
  </xsl:if>
  
  <xsl:variable name="elemtype">
    <xsl:choose>
      <xsl:when test="count(ancestor::section) = 0">h1</xsl:when>
      <xsl:when test="count(ancestor::section) = 1">h2</xsl:when>
      <xsl:when test="count(ancestor::section) = 2">h3</xsl:when>
      <xsl:when test="count(ancestor::section) = 3">h4</xsl:when>
      <xsl:otherwise>h5</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <!-- process irefs immediadetely following the section so that their anchor
  actually is the section heading -->
  <xsl:apply-templates select="iref[count(preceding-sibling::*[not(self::iref)])=0]"/>

  <xsl:element name="{$elemtype}">
    <xsl:if test="$sectionNumber!=''">
      <xsl:attribute name="id"><xsl:value-of select="$anchor-prefix"/>.section.<xsl:value-of select="$sectionNumber"/></xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$sectionNumber='1'">
        <!-- pagebreak, this the first section -->
        <xsl:attribute name="class">np</xsl:attribute>
      </xsl:when>
      <xsl:when test="not(ancestor::section) and not(@myns:notoclink)">
        <xsl:call-template name="insert-conditional-pagebreak"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
    
    <xsl:call-template name="insertInsDelClass" />
        
    <xsl:if test="$sectionNumber!=''">
      <a href="#{$anchor-prefix}.section.{$sectionNumber}">
        <xsl:call-template name="emit-section-number">
          <xsl:with-param name="no" select="$sectionNumber"/>
        </xsl:call-template>
      </a>
      <xsl:text>&#0160;</xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@anchor">
        <a name="{@anchor}" href="#{@anchor}"><xsl:call-template name="insertTitle"/></a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="insertTitle"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
  <!-- continue with all child elements but the irefs processed above -->
  <xsl:apply-templates select="*[not(self::iref)]|iref[count(preceding-sibling::*[not(self::iref)])!=0]" />
</xsl:template>

<xsl:template match="spanx[@style='emph' or not(@style)]">
  <em><xsl:apply-templates /></em>
</xsl:template>

<xsl:template match="spanx[@style='verb']">
  <samp><xsl:apply-templates /></samp>
</xsl:template>

<xsl:template match="spanx[@style='strong']">
  <strong><xsl:apply-templates /></strong>
</xsl:template>

<xsl:template name="insert-blank-lines">
  <xsl:param name="no"/>
  <xsl:choose>
    <xsl:when test="$no &lt;= 0">
      <br/>
      <!-- done -->
    </xsl:when>
    <xsl:otherwise>
      <br/>
      <xsl:call-template name="insert-blank-lines">
        <xsl:with-param name="no" select="$no - 1"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="vspace[not(@blankLines)]">
  <br />
</xsl:template>

<xsl:template match="vspace">
  <xsl:call-template name="insert-blank-lines">
    <xsl:with-param name="no" select="@blankLines"/>
  </xsl:call-template>
</xsl:template>

<!-- keep the root for the case when we process XSLT-inline markup -->
<xsl:variable name="src" select="/" />

<xsl:template match="xref[node()]">
  <xsl:variable name="target" select="@target" />
  <xsl:variable name="node" select="$src//*[@anchor=$target]" />
  <a href="#{$target}"><xsl:apply-templates /></a>
  <xsl:for-each select="$src/rfc/back/references//reference[@anchor=$target]">
    <xsl:text> </xsl:text><xsl:call-template name="referencename">
       <xsl:with-param name="node" select="." />
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>
               
<xsl:template match="xref[not(node())]">
  <xsl:variable name="context" select="." />
  <xsl:variable name="target" select="@target" />
  <xsl:variable name="node" select="$src//*[@anchor=$target]" />
  <xsl:if test="count($node)=0 and not(ancestor::ed:del)">
    <xsl:message>Undefined target: <xsl:value-of select="@target" /></xsl:message>
    <span class="error">Undefined target: <xsl:value-of select="@target" /></span>
  </xsl:if>
  <a href="#{$target}">
    <xsl:choose>
      <xsl:when test="local-name($node)='section'">
        <xsl:variable name="refname">
          <xsl:for-each select="$node">
            <xsl:call-template name="get-section-type">
              <xsl:with-param name="prec" select="$context/preceding-sibling::node()[1]" />
            </xsl:call-template>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="refnum">
          <xsl:for-each select="$node">
            <xsl:call-template name="get-section-number" />
          </xsl:for-each>
        </xsl:variable>
        <xsl:attribute name="title">
          <xsl:value-of select="$node/@title" />
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="@format='counter'">
            <xsl:value-of select="$refnum"/>
          </xsl:when>
          <xsl:when test="@format='title'">
            <xsl:value-of select="$node/@title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(concat($refname,'&#160;',$refnum))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="local-name($node)='figure'">
        <xsl:variable name="figcnt">
          <xsl:for-each select="$node">
            <xsl:number level="any" count="figure[@title!='' or @anchor!='']" />
          </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="@format='counter'">
            <xsl:value-of select="$figcnt" />
          </xsl:when>
          <xsl:when test="@format='title'">
            <xsl:value-of select="$node/@title" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(concat('Figure&#160;',$figcnt))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="title"><xsl:value-of select="normalize-space($node/front/title)" /></xsl:attribute>
        <xsl:call-template name="referencename"><xsl:with-param name="node" select="$src/rfc/back/references//reference[@anchor=$target]" /></xsl:call-template></xsl:otherwise>
    </xsl:choose>
  </a>
</xsl:template>


<!-- mark unmatched elements red -->

<xsl:template match="*">
     <font color="red"><tt>&lt;<xsl:value-of select="name()" />&gt;</tt></font>
    <xsl:copy><xsl:apply-templates select="node()|@*" /></xsl:copy>
     <font color="red"><tt>&lt;/<xsl:value-of select="name()" />&gt;</tt></font>
</xsl:template>

<xsl:template match="/">
  <xsl:copy><xsl:apply-templates select="node()" /></xsl:copy>
</xsl:template>








<!-- utility templates -->

<xsl:template name="collectLeftHeaderColumn">
  <xsl:param name="mode" />
  <!-- default case -->
  <xsl:if test="not($xml2rfc-private)">
    <myns:item>Network Working Group</myns:item>
    <myns:item>
       <xsl:choose>
        <xsl:when test="/rfc/@ipr and $mode='nroff'">Internet Draft</xsl:when>
        <xsl:when test="/rfc/@ipr">INTERNET DRAFT</xsl:when>
        <xsl:otherwise>Request for Comments: <xsl:value-of select="/rfc/@number"/></xsl:otherwise>
      </xsl:choose>
    </myns:item>
    <xsl:if test="/rfc/@docName and $mode!='nroff'">
      <myns:item>
        &lt;<xsl:value-of select="/rfc/@docName" />&gt;
      </myns:item>
    </xsl:if>
    <xsl:if test="/rfc/@obsoletes and /rfc/@obsoletes!=''">
      <myns:item>
        <xsl:text>Obsoletes: </xsl:text>
        <xsl:call-template name="rfclist">
          <xsl:with-param name="list" select="normalize-space(/rfc/@obsoletes)" />
        </xsl:call-template>
        <xsl:if test="not(/rfc/@number)"> (if approved)</xsl:if>
      </myns:item>
    </xsl:if>
    <xsl:if test="/rfc/@seriesNo">
       <myns:item>
        <xsl:choose>
          <xsl:when test="/rfc/@category='bcp'">BCP: <xsl:value-of select="/rfc/@seriesNo" /></xsl:when>
          <xsl:when test="/rfc/@category='info'">FYI: <xsl:value-of select="/rfc/@seriesNo" /></xsl:when>
          <xsl:when test="/rfc/@category='std'">STD: <xsl:value-of select="/rfc/@seriesNo" /></xsl:when>
          <xsl:otherwise><xsl:value-of select="concat(/rfc/@category,': ',/rfc/@seriesNo)" /></xsl:otherwise>
        </xsl:choose>
      </myns:item>
    </xsl:if>
    <xsl:if test="/rfc/@updates and /rfc/@updates!=''">
      <myns:item>
        <xsl:text>Updates: </xsl:text>
          <xsl:call-template name="rfclist">
             <xsl:with-param name="list" select="normalize-space(/rfc/@updates)" />
          </xsl:call-template>
          <xsl:if test="not(/rfc/@number)"> (if approved)</xsl:if>
      </myns:item>
    </xsl:if>
    <xsl:if test="$mode!='nroff'">
      <myns:item>
        <xsl:text>Category: </xsl:text>
        <xsl:call-template name="get-category-long" />
      </myns:item>
    </xsl:if>
    <xsl:if test="/rfc/@ipr">
       <myns:item>Expires: <xsl:call-template name="expirydate" /></myns:item>
    </xsl:if>
  </xsl:if>
    
  <!-- private case -->
  <xsl:if test="$xml2rfc-private">
    <myns:item><xsl:value-of select="$xml2rfc-private" /></myns:item>
  </xsl:if>
</xsl:template>

<xsl:template name="collectRightHeaderColumn">
  <xsl:for-each select="author">
    <xsl:if test="@surname">
      <myns:item>
        <xsl:value-of select="concat(@initials,' ',@surname)" />
        <xsl:if test="@role">
          <xsl:choose>
            <xsl:when test="@role='editor'">
              <xsl:text>, Editor</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>, </xsl:text><xsl:value-of select="@role" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </myns:item>
    </xsl:if>
    <xsl:variable name="org">
      <xsl:choose>
        <xsl:when test="organization/@abbrev"><xsl:value-of select="organization/@abbrev" /></xsl:when>
        <xsl:otherwise><xsl:value-of select="organization" /></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="orgOfFollowing">
      <xsl:choose>
        <xsl:when test="following-sibling::*[1]/organization/@abbrev"><xsl:value-of select="following-sibling::*[1]/organization/@abbrev" /></xsl:when>
        <xsl:otherwise><xsl:value-of select="following-sibling::*/organization" /></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$org != $orgOfFollowing">
      <myns:item><xsl:value-of select="$org" /></myns:item>
    </xsl:if>
  </xsl:for-each>
  <myns:item>
    <xsl:value-of select="concat(date/@month,' ',date/@year)" />
  </myns:item>
</xsl:template>


<xsl:template name="emitheader">
  <xsl:param name="lc" />
  <xsl:param name="rc" />

  <xsl:for-each select="$lc/myns:item | $rc/myns:item">
    <xsl:variable name="pos" select="position()" />
    <xsl:if test="$pos &lt; count($lc/myns:item) + 1 or $pos &lt; count($rc/myns:item) + 1"> 
      <tr>
        <td class="header-l"><xsl:call-template name="copynodes"><xsl:with-param name="nodes" select="$lc/myns:item[$pos]/node()" /></xsl:call-template>&#0160;</td>
        <td class="header-r"><xsl:call-template name="copynodes"><xsl:with-param name="nodes" select="$rc/myns:item[$pos]/node()" /></xsl:call-template>&#0160;</td>
      </tr>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- convenience template that avoids copying namespace nodes we don't want -->
<xsl:template name="copynodes">
  <xsl:param name="nodes" />
  <xsl:for-each select="$nodes">
    <xsl:choose>
      <xsl:when test="namespace-uri()='http://www.w3.org/1999/xhtml'"><xsl:element name="{name()}" namespace="{namespace-uri()}"><xsl:copy-of select="@*|node()" /></xsl:element></xsl:when>
      <xsl:when test="self::*"><xsl:element name="{name()}"><xsl:copy-of select="@*|node()" /></xsl:element></xsl:when>
      <xsl:otherwise><xsl:copy-of select="." /></xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>


<xsl:template name="expirydate">
  <xsl:variable name="date" select="/rfc/front/date" />
  <xsl:choose>
      <xsl:when test="$date/@month='January'">July <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='February'">August <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='March'">September <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='April'">October <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='May'">November <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='June'">December <xsl:value-of select="$date/@year" /></xsl:when>
      <xsl:when test="$date/@month='July'">January <xsl:value-of select="$date/@year + 1" /></xsl:when>
      <xsl:when test="$date/@month='August'">February <xsl:value-of select="$date/@year + 1" /></xsl:when>
      <xsl:when test="$date/@month='September'">March <xsl:value-of select="$date/@year + 1" /></xsl:when>
      <xsl:when test="$date/@month='October'">April <xsl:value-of select="$date/@year + 1" /></xsl:when>
      <xsl:when test="$date/@month='November'">May <xsl:value-of select="$date/@year + 1" /></xsl:when>
      <xsl:when test="$date/@month='December'">June <xsl:value-of select="$date/@year + 1" /></xsl:when>
        <xsl:otherwise>WRONG SYNTAX FOR MONTH</xsl:otherwise>
     </xsl:choose>
</xsl:template>

<xsl:template name="get-month-as-num">
  <xsl:variable name="date" select="/rfc/front/date" />
  <xsl:choose>
      <xsl:when test="$date/@month='January'">01</xsl:when>
      <xsl:when test="$date/@month='February'">02</xsl:when>
      <xsl:when test="$date/@month='March'">03</xsl:when>
      <xsl:when test="$date/@month='April'">04</xsl:when>
      <xsl:when test="$date/@month='May'">05</xsl:when>
      <xsl:when test="$date/@month='June'">06</xsl:when>
      <xsl:when test="$date/@month='July'">07</xsl:when>
      <xsl:when test="$date/@month='August'">08</xsl:when>
      <xsl:when test="$date/@month='September'">09</xsl:when>
      <xsl:when test="$date/@month='October'">10</xsl:when>
      <xsl:when test="$date/@month='November'">11</xsl:when>
      <xsl:when test="$date/@month='December'">12</xsl:when>
        <xsl:otherwise>WRONG SYNTAX FOR MONTH</xsl:otherwise>
     </xsl:choose>
</xsl:template>

<!-- produce back section with author information -->
<xsl:template name="get-authors-section-title">
  <xsl:choose>
    <xsl:when test="count(/rfc/front/author)=1">Author's Address</xsl:when>
    <xsl:otherwise>Authors' Addresses</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="insertAuthors">

  <xsl:call-template name="insert-conditional-hrule"/>
    
  <h1 id="{$anchor-prefix}.authors">
    <xsl:call-template name="insert-conditional-pagebreak"/>
    <xsl:call-template name="get-authors-section-title"/>
  </h1>

  <xsl:apply-templates select="/rfc/front/author" />
</xsl:template>



<!-- insert copyright statement -->

<xsl:template name="insertCopyright" xmlns="">

  <section title="Intellectual Property Statement" anchor="{$anchor-prefix}.ipr" myns:unnumbered="unnumbered" myns:is-rfc2629="true">
    <xsl:choose>
      <xsl:when test="$ipr-rfc3667">
        <t myns:is-rfc2629="true">
          The IETF takes no position regarding the validity or scope of any
          Intellectual Property Rights or other rights that might be claimed to
          pertain to the implementation or use of the technology described in
          this document or the extent to which any license under such rights
          might or might not be available; nor does it represent that it has
          made any independent effort to identify any such rights.  Information
          on the procedures with respect to rights in RFC documents
          can be found in BCP 78 and BCP 79.
        </t>       
        <t myns:is-rfc2629="true">
          Copies of IPR disclosures made to the IETF Secretariat and any
          assurances of licenses to be made available, or the result of an
          attempt made to obtain a general license or permission for the use
          of such proprietary rights by implementers or users of this
          specification can be obtained from the IETF on-line IPR repository 
          at <eref myns:is-rfc2629="true" target="http://www.ietf.org/ipr"/>.
        </t>       
        <t myns:is-rfc2629="true">
          The IETF invites any interested party to bring to its attention any
          copyrights, patents or patent applications, or other proprietary
          rights that may cover technology that may be required to implement
          this standard. Please address the information to the IETF at
          <eref myns:is-rfc2629="true" target="mailto:ietf-ipr@ietf.org">ietf-ipr@ietf.org</eref>.
        </t>       
      </xsl:when>
      <xsl:otherwise>
        <t myns:is-rfc2629="true">
          The IETF takes no position regarding the validity or scope of
          any intellectual property or other rights that might be claimed
          to  pertain to the implementation or use of the technology
          described in this document or the extent to which any license
          under such rights might or might not be available; neither does
          it represent that it has made any effort to identify any such
          rights. Information on the IETF's procedures with respect to
          rights in standards-track and standards-related documentation
          can be found in BCP-11. Copies of claims of rights made
          available for publication and any assurances of licenses to
          be made available, or the result of an attempt made
          to obtain a general license or permission for the use of such
          proprietary rights by implementors or users of this
          specification can be obtained from the IETF Secretariat.
        </t>
        <t myns:is-rfc2629="true">
          The IETF invites any interested party to bring to its
          attention any copyrights, patents or patent applications, or
          other proprietary rights which may cover technology that may be
          required to practice this standard. Please address the
          information to the IETF Executive Director.
        </t>
        <xsl:if test="$xml2rfc-iprnotified='yes'">
          <t myns:is-rfc2629="true">
            The IETF has been notified of intellectual property rights
            claimed in regard to some or all of the specification contained
            in this document. For more information consult the online list
            of claimed rights.
          </t>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </section>
  
  <xsl:if test="$ipr-rfc3667">
    <section title="Disclaimer of Validity" anchor="{$anchor-prefix}.disclaimer" myns:unnumbered="unnumbered" myns:notoclink="notoclink" myns:is-rfc2629="true">
      <t myns:is-rfc2629="true">
        This document and the information contained herein are provided on an
        &#8220;AS IS&#8221; basis and THE CONTRIBUTOR, THE ORGANIZATION HE/SHE REPRESENTS
        OR IS SPONSORED BY (IF ANY), THE INTERNET SOCIETY AND THE INTERNET
        ENGINEERING TASK FORCE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED,
        INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE 
        INFORMATION HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED 
        WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
      </t>
    </section>
  </xsl:if>

  <xsl:choose>
    <xsl:when test="$ipr-rfc3667">
      <section title="Copyright Statement" anchor="{$anchor-prefix}.copyright" myns:unnumbered="unnumbered" myns:notoclink="notoclink" myns:is-rfc2629="true">
        <t myns:is-rfc2629="true">
          Copyright &#169; The Internet Society (<xsl:value-of select="/rfc/front/date/@year" />).
          This document is subject to the rights, licenses and restrictions
          contained in BCP 78, and except as set forth therein, the authors
          retain all their rights.
        </t>
      </section>    
    </xsl:when>
    <xsl:otherwise>
      <section title="Full Copyright Statement" anchor="{$anchor-prefix}.copyright" myns:unnumbered="unnumbered" myns:notoclink="notoclink" myns:is-rfc2629="true">
        <t myns:is-rfc2629="true">
          Copyright &#169; The Internet Society (<xsl:value-of select="/rfc/front/date/@year" />). All Rights Reserved.
        </t>
        <t myns:is-rfc2629="true">
          This document and translations of it may be copied and furnished to
          others, and derivative works that comment on or otherwise explain it
          or assist in its implementation may be prepared, copied, published and
          distributed, in whole or in part, without restriction of any kind,
          provided that the above copyright notice and this paragraph are
          included on all such copies and derivative works. However, this
          document itself may not be modified in any way, such as by removing
          the copyright notice or references to the Internet Society or other
          Internet organizations, except as needed for the purpose of
          developing Internet standards in which case the procedures for
          copyrights defined in the Internet Standards process must be
          followed, or as required to translate it into languages other than
          English.
        </t>
        <t myns:is-rfc2629="true">
          The limited permissions granted above are perpetual and will not be
          revoked by the Internet Society or its successors or assignees.
        </t>
        <t myns:is-rfc2629="true">
          This document and the information contained herein is provided on an
          &#8220;;AS IS&#8221; basis and THE INTERNET SOCIETY AND THE INTERNET ENGINEERING
          TASK FORCE DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
          BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION
          HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF
          MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
        </t>
      </section>
    </xsl:otherwise>
  </xsl:choose>
  
  <section title="Acknowledgement" myns:unnumbered="unnumbered" myns:notoclink="notoclink" myns:is-rfc2629="true">
    <t myns:is-rfc2629="true">
      Funding for the RFC Editor function is currently provided by the
      Internet Society.
    </t>
  </section>

</xsl:template>


<!-- insert CSS style info -->

<xsl:template name="insertCss">
a {
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}
a:active {
  text-decoration: underline;
}
address {
  margin-top: 1em;
  margin-left: 2em;
  font-style: normal;
}
body {
  <xsl:if test="$xml2rfc-background!=''">
  background: url(<xsl:value-of select="$xml2rfc-background" />) #ffffff left top;
  </xsl:if>
  color: #000000;
  font-family: verdana, helvetica, arial, sans-serif;
  font-size: 10pt;
}
dl {
  margin-left: 2em;
}
h1 {
  color: #333333;
  font-size: 14pt;
  line-height: 21pt;
  page-break-after: avoid;
}
h1.np {
  page-break-before: always;
}
h1 a {
  color: #333333;
}
h2 {
  color: #000000;
  font-size: 12pt;
  line-height: 15pt;
  page-break-after: avoid;
}
h2 a {
  color: #000000;
}
h3 {
  color: #000000;
  font-size: 10pt;
  page-break-after: avoid;
}
h3 a {
  color: #000000;
}
h4 {
  color: #000000;
  font-size: 10pt;
  page-break-after: avoid;
}
h4 a {
  color: #000000;
}
h5 {
  color: #000000;
  font-size: 10pt;
  page-break-after: avoid;
}
h5 a {
  color: #000000;
}
img {
  margin-left: 3em;
}
li {
  margin-left: 2em;
  margin-right: 2em;
}
ol {
  margin-left: 2em;
  margin-right: 2em;
}
p {
  margin-left: 2em;
  margin-right: 2em;
}
pre {
  margin-left: 3em;
  background-color: lightyellow;
}
table {
  margin-left: 2em;
}
table.header {
  width: 95%;
  font-size: 10pt;
  color: white;
}
td.top {
  vertical-align: top;
}
td.topnowrap {
  vertical-align: top;
  white-space: nowrap; 
}
td.right {
  text-align: right;
}
td.header-l {
  background-color: gray;
  width: 50%;
}
td.header-r {
  background-color: gray;
  width: 50%;
  text-align: right;
}
thead {
  display:table-header-group;
}
ul.toc {
  list-style: none;
  margin-left: 1.5em;
  margin-right: 0em;
  padding-left: 0em;
}
li.tocline0 {
  line-height: 150%;
  font-weight: bold;
  font-size: 10pt;
  margin-left: 0em;
  margin-right: 0em;
}
li.tocline1 {
  line-height: normal;
  font-weight: normal;
  font-size: 9pt;
  margin-left: 0em;
  margin-right: 0em;
}
li.tocline2 {
  font-size: 0pt;
}
ul.ind {
  list-style: none;
  margin-left: 1.5em;
  margin-right: 0em;
  padding-left: 0em;
}
li.indline0 {
  font-weight: bold;
  line-height: 200%;
  margin-left: 0em;
  margin-right: 0em;
}
li.indline1 {
  font-weight: normal;
  line-height: 150%;
  margin-left: 0em;
  margin-right: 0em;
}
.comment {
  background-color: yellow;
}
.editingmark {
  background-color: khaki;
}
.error {
  font-size: 14pt;
  background-color: red;
}
.toowide {
  color: red;
  font-weight: bold;
}
.title {
  color: #990000;
  font-size: 18pt;
  line-height: 18pt;
  font-weight: bold;
  text-align: center;
}
.figure {
  font-weight: bold;
  text-align: center;
  font-size: 9pt;
}
.filename {
  color: #333333;
  font-weight: bold;
  font-size: 12pt;
  line-height: 21pt;
  text-align: center;
}
.warning {
  font-size: 14pt;
  background-color: yellow;
}
del {
  color: red;
  text-decoration: line-through;
}
.del {
  color: red;
  text-decoration: line-through;
}
.fn {
  font-weight: bold;
}
ins {
  color: green;
  text-decoration: underline;
}
.ins {
  color: green;
  text-decoration: underline;
}
.pn {
  position: absolute;
  color: white;
}
.pn:hover {
  color: #C8A8FF;
}
.vcardline {
  display: block;
}

table.openissue {
  background-color: khaki;
  border-width: thin;
  border-style: solid;
  border-color: black;
}

table.closedissue {
  background-color: white;
  border-width: thin;
  border-style: solid;
  border-color: gray;
  color: gray; 
}

.closed-issue {
  border: solid;
  border-width: thin;
  background-color: lime;
  font-size: smaller;
  font-weight: bold;
}

.open-issue {
  border: solid;
  border-width: thin;
  background-color: red;
  font-size: smaller;
  font-weight: bold;
}

.editor-issue {
  border: solid;
  border-width: thin;
  background-color: yellow;
  font-size: smaller;
  font-weight: bold;
}

@media print {
  .noprint {
    display: none;
  }
  
  table.header {
    width: 90%;
  }

  td.header-l {
    width: 50%;
    color: black;
    background-color: white;
    vertical-align: top;
    font-size: 10pt;
  }

  td.header-r {
    width: 33%;
    color: black;
    background-color: white;
    vertical-align: top;
    text-align: right;
    font-size: 10pt;
  }

  ul.toc a::after {
    content: leader('.') target-counter(attr(href), page);
  }
  
  a.iref {
    content: target-counter(attr(href), page);
  }
}

@page {
  @top-left {
       content: "<xsl:call-template name="get-header-left"/>"; 
  } 
  @top-right {
       content: "<xsl:call-template name="get-header-right"/>"; 
  } 
  @top-center {
       content: "<xsl:call-template name="get-header-center"/>"; 
  } 
  @bottom-left {
       content: "<xsl:call-template name="get-author-summary"/>"; 
  } 
  @bottom-center {
       content: "<xsl:call-template name="get-category-long"/>"; 
  } 
  @bottom-right {
       content: "[Page " counter(page) "]"; 
  } 
}

@page:first { 
    @top-left {
      content: normal;
    }
    @top-right {
      content: normal;
    }
    @top-center {
      content: normal;
    }
}
</xsl:template>


<!-- generate the index section -->

<xsl:template name="insertSingleIref">
  <xsl:choose>
    <xsl:when test="@ed:xref">
      <!-- special index generator mode -->
      <xsl:text>[</xsl:text>
      <a href="#{@ed:xref}"><xsl:value-of select="@ed:xref"/></a>
      <xsl:text>, </xsl:text>
      <a>
        <xsl:variable name="htmluri" select="//reference[@anchor=current()/@ed:xref]/format[@type='HTML']/@target"/>
        <xsl:if test="$htmluri">
          <xsl:attribute name="href"><xsl:value-of select="concat($htmluri,'#',@ed:frag)"/></xsl:attribute>
        </xsl:if>       
        <xsl:choose>
          <xsl:when test="@primary='true'"><b><xsl:value-of select="@ed:label" /></b></xsl:when>
          <xsl:otherwise><xsl:value-of select="@ed:label" /></xsl:otherwise>
        </xsl:choose>
      </a>
      <xsl:text>]</xsl:text>
      <xsl:if test="position()!=last()">, </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="_n">
        <xsl:call-template name="get-section-number" />
      </xsl:variable>
      <xsl:variable name="n">
        <xsl:choose>
          <xsl:when test="$_n!=''">
            <xsl:value-of select="$_n"/>
          </xsl:when>
          <xsl:otherwise>&#167;</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="backlink">#<xsl:value-of select="$anchor-prefix"/>.iref.<xsl:number level="any" /></xsl:variable>
      <a class="iref" href="{$backlink}">
        <xsl:choose>
          <xsl:when test="@primary='true'"><b><xsl:value-of select="$n"/></b></xsl:when>
          <xsl:otherwise><xsl:value-of select="$n"/></xsl:otherwise>
        </xsl:choose>
      </a>
      <xsl:if test="position()!=last()">, </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="insertIndex">

  <xsl:call-template name="insert-conditional-hrule"/>

  <h1 id="{$anchor-prefix}.index">
    <xsl:call-template name="insert-conditional-pagebreak"/>
    <a href="#{$anchor-prefix}.index">Index</a>
  </h1>
  
  <p class="noprint">
    <xsl:for-each select="//iref[generate-id(.) = generate-id(key('index-first-letter',translate(substring(@item,1,1),$lcase,$ucase)))]">
      <xsl:sort select="translate(@item,$lcase,$ucase)" />
      
      <xsl:variable name="letter" select="translate(substring(@item,1,1),$lcase,$ucase)"/>
      <a href="#{$anchor-prefix}.index.{$letter}">
        <xsl:value-of select="$letter" />
        <xsl:text> </xsl:text>
      </a>
    </xsl:for-each>
  </p>

  <ul class="ind">
  
    <xsl:for-each select="//iref[generate-id(.) = generate-id(key('index-first-letter',translate(substring(@item,1,1),$lcase,$ucase)))]">
      <xsl:sort select="translate(@item,$lcase,$ucase)" />
            
      <li class="indline0">
        <xsl:variable name="letter" select="translate(substring(@item,1,1),$lcase,$ucase)"/>
        <a name="{$anchor-prefix}.index.{$letter}" href="#{$anchor-prefix}.index.{$letter}">
          <b><xsl:value-of select="$letter" /></b>
        </a>
      
        <ul class="ind">  
          <xsl:for-each select="key('index-first-letter',translate(substring(@item,1,1),$lcase,$ucase))">
      
            <xsl:sort select="translate(@item,$lcase,$ucase)" />
            
            <xsl:if test="generate-id(.) = generate-id(key('index-item',@item))">
            
              <xsl:variable name="item" select="@item"/>
              <xsl:variable name="in-artwork" select="count(//iref[@item=$item and @primary='true' and ancestor::artwork])!=0"/>
                  
              <li class="indline1">
                <xsl:choose>
                  <xsl:when test="$in-artwork">
                    <tt><xsl:value-of select="@item" /></tt>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="@item" />
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#160;&#160;</xsl:text>
                
                <xsl:for-each select="key('index-item',@item)[not(@subitem) or @subitem='']">
                  <xsl:sort select="translate(@item,$lcase,$ucase)" />
                  <xsl:call-template name="insertSingleIref" />
                </xsl:for-each>
  
                <xsl:variable name="s2" select="key('index-item',@item)[@subitem and @subitem!='']"/>
                <xsl:if test="$s2">
                  <ul class="ind">  
                    <xsl:for-each select="$s2">
                      <xsl:sort select="translate(@subitem,$lcase,$ucase)" />
                      
                      <xsl:if test="generate-id(.) = generate-id(key('index-item-subitem',concat(@item,'..',@subitem)))">
          
                        <xsl:variable name="itemsubitem" select="concat(@item,'..',@subitem)"/>
                        <xsl:variable name="in-artwork2" select="count(//iref[concat(@item,'..',@subitem)=$itemsubitem and @primary='true' and ancestor::artwork])!=0"/>
          
                        <li class="indline1">
      
                          <xsl:choose>
                            <xsl:when test="$in-artwork2">
                              <tt><xsl:value-of select="@subitem" /></tt>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="@subitem" />
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:text>&#160;&#160;</xsl:text>
                            
                          <xsl:for-each select="key('index-item-subitem',concat(@item,'..',@subitem))">
                            <xsl:sort select="translate(@item,$lcase,$ucase)" />                    
                            <xsl:call-template name="insertSingleIref" />
                          </xsl:for-each>
        
                        </li>
                      </xsl:if>
                    </xsl:for-each>
                  </ul>
                </xsl:if>
              </li>
            </xsl:if>
                    
          </xsl:for-each>            
        </ul>
      </li>
    </xsl:for-each>
  </ul>

</xsl:template>




<xsl:template name="insertPreamble" xmlns="">

  <section title="Status of this Memo" myns:unnumbered="unnumbered" myns:notoclink="notoclink" anchor="{$anchor-prefix}.status" myns:is-rfc2629="true">

  <xsl:choose>
    <xsl:when test="/rfc/@ipr">
      <t myns:is-rfc2629="true">
        <xsl:choose>
          
          <!-- RFC2026 -->
          <xsl:when test="/rfc/@ipr = 'full2026'">
            This document is an Internet-Draft and is 
            in full conformance with all provisions of Section 10 of RFC2026.    
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noDerivativeWorks2026'">
            This document is an Internet-Draft and is 
            in full conformance with all provisions of Section 10 of RFC2026
            except that the right to produce derivative works is not granted.   
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noDerivativeWorksNow'">
            This document is an Internet-Draft and is 
            in full conformance with all provisions of Section 10 of RFC2026
            except that the right to produce derivative works is not granted.
            (If this document becomes part of an IETF working group activity,
            then it will be brought into full compliance with Section 10 of RFC2026.)  
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'none'">
            This document is an Internet-Draft and is 
            NOT offered in accordance with Section 10 of RFC2026,
            and the author does not provide the IETF with any rights other
            than to publish as an Internet-Draft.
          </xsl:when>
          
          <!-- RFC3667 -->
          <xsl:when test="/rfc/@ipr = 'full3667'">
            This document is an Internet-Draft and is subject to all provisions
            of section 3 of RFC 3667.  By submitting this Internet-Draft, each
            author represents that any applicable patent or other IPR claims of
            which he or she is aware have been or will be disclosed, and any of
            which he or she become aware will be disclosed, in accordance with
            RFC 3668.
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noModification3667'">
            This document is an Internet-Draft and is subject to all provisions
            of section 3 of RFC 3667.  By submitting this Internet-Draft, each
            author represents that any applicable patent or other IPR claims of
            which he or she is aware have been or will be disclosed, and any of
            which he or she become aware will be disclosed, in accordance with
            RFC 3668.  This document may not be modified, and derivative works of
            it may not be created, except to publish it as an RFC and to
            translate it into languages other than English<xsl:if test="/rfc/@iprExtract">,
            other than to extract <xref myns:is-rfc2629="true" target="{/rfc/@iprExtract}"/> as-is
            for separate use.</xsl:if>.
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noDerivatives3667'">
            This document is an Internet-Draft and is subject to all provisions
            of section 3 of RFC 3667 except for the right to produce derivative
            works.  By submitting this Internet-Draft, each author represents 
            that any applicable patent or other IPR claims of which he or she
            is aware have been or will be disclosed, and any of which he or she
            become aware will be disclosed, in accordance with RFC 3668.  This
            document may not be modified, and derivative works of it may
            not be created<xsl:if test="/rfc/@iprExtract">, other than to extract
            <xref myns:is-rfc2629="true" target="{/rfc/@iprExtract}"/> as-is for separate use.</xsl:if>.
          </xsl:when>
          
          <!-- RFC3978 -->
          <xsl:when test="/rfc/@ipr = 'full3978'">
            By submitting this Internet-Draft, each
            author represents that any applicable patent or other IPR claims of
            which he or she is aware have been or will be disclosed, and any of
            which he or she becomes aware will be disclosed, in accordance with
            Section 6 of BCP 79.
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noModification3978'">
            By submitting this Internet-Draft, each
            author represents that any applicable patent or other IPR claims of
            which he or she is aware have been or will be disclosed, and any of
            which he or she becomes aware will be disclosed, in accordance with
            Section 6 of BCP 79.  This document may not be modified, and derivative works of
            it may not be created, except to publish it as an RFC and to
            translate it into languages other than English<xsl:if test="/rfc/@iprExtract">,
            other than to extract <xref myns:is-rfc2629="true" target="{/rfc/@iprExtract}"/> as-is
            for separate use.</xsl:if>.
          </xsl:when>
          <xsl:when test="/rfc/@ipr = 'noDerivatives3978'">
            By submitting this Internet-Draft, each author represents 
            that any applicable patent or other IPR claims of which he or she
            is aware have been or will be disclosed, and any of which he or she
            becomes aware will be disclosed, in accordance with Section 6 of BCP 79.  This
            document may not be modified, and derivative works of it may
            not be created<xsl:if test="/rfc/@iprExtract">, other than to extract
            <xref myns:is-rfc2629="true" target="{/rfc/@iprExtract}"/> as-is for separate use.</xsl:if>.
          </xsl:when>

          <xsl:otherwise>CONFORMANCE UNDEFINED.</xsl:otherwise>
        </xsl:choose>
      </t>
      <t myns:is-rfc2629="true">
        Internet-Drafts are working documents of the Internet Engineering
        Task Force (IETF), its areas, and its working groups.
        Note that other groups may also distribute working documents as
        Internet-Drafts.
      </t>
      <t myns:is-rfc2629="true">
        Internet-Drafts are draft documents valid for a maximum of six months
        and may be updated, replaced, or obsoleted by other documents at any time.
        It is inappropriate to use Internet-Drafts as reference material or to cite
        them other than as &#8220;work in progress&#8221;.
      </t>
      <t myns:is-rfc2629="true">
        The list of current Internet-Drafts can be accessed at
        <eref target='http://www.ietf.org/ietf/1id-abstracts.txt' myns:is-rfc2629="true" />.
      </t>
      <t myns:is-rfc2629="true">
        The list of Internet-Draft Shadow Directories can be accessed at
        <eref target='http://www.ietf.org/shadow.html' myns:is-rfc2629="true"/>.
      </t>
      <t myns:is-rfc2629="true">
        This Internet-Draft will expire in <xsl:call-template name="expirydate" />.
      </t>
    </xsl:when>

    <xsl:when test="/rfc/@category='bcp'">
      <t myns:is-rfc2629="true">
        This document specifies an Internet Best Current Practices for the Internet
        Community, and requests discussion and suggestions for improvements.
        Distribution of this memo is unlimited.
      </t>
    </xsl:when>
    <xsl:when test="/rfc/@category='exp'">
      <t myns:is-rfc2629="true">
        This memo defines an Experimental Protocol for the Internet community.
        It does not specify an Internet standard of any kind.
        Discussion and suggestions for improvement are requested.
        Distribution of this memo is unlimited.
      </t>
    </xsl:when>
    <xsl:when test="/rfc/@category='historic'">
      <t myns:is-rfc2629="true">
        This memo describes a historic protocol for the Internet community.
        It does not specify an Internet standard of any kind.
        Distribution of this memo is unlimited.
      </t>
    </xsl:when>
    <xsl:when test="/rfc/@category='info' or not(/rfc/@category)">
      <t myns:is-rfc2629="true">
        This memo provides information for the Internet community.
        It does not specify an Internet standard of any kind.
        Distribution of this memo is unlimited.
      </t>
    </xsl:when>
    <xsl:when test="/rfc/@category='std'">
      <t myns:is-rfc2629="true">
        This document specifies an Internet standards track protocol for the Internet
        community, and requests discussion and suggestions for improvements.
        Please refer to the current edition of the &#8220;Internet Official Protocol
        Standards&#8221; (STD 1) for the standardization state and status of this
        protocol. Distribution of this memo is unlimited.
      </t>
    </xsl:when>
    <xsl:otherwise>
      <t myns:is-rfc2629="true">UNSUPPORTED CATEGORY.</t>
    </xsl:otherwise>
  </xsl:choose>
  
  </section>

  <section title="Copyright Notice" myns:unnumbered="unnumbered" myns:notoclink="notoclink" anchor="{$anchor-prefix}.copyrightnotice" myns:is-rfc2629="true">
  <t myns:is-rfc2629="true">
    Copyright &#169; The Internet Society (<xsl:value-of select="/rfc/front/date/@year" />). All Rights Reserved.
  </t>
  </section>
  
</xsl:template>

<!-- TOC generation -->

<xsl:template match="/" mode="toc">
  <hr class="noprint"/>

  <h1 class="np" id="{$anchor-prefix}.toc"> <!-- this pagebreak occurs always -->
    <a href="#{$anchor-prefix}.toc">Table of Contents</a>
  </h1>

  <ul class="toc">
    <xsl:apply-templates mode="toc" />
  </ul>
</xsl:template>

<xsl:template name="insert-toc-line">
  <xsl:param name="number" />
  <xsl:param name="target" />
  <xsl:param name="title" />
  <xsl:param name="tocparam" />

  <!-- handle tocdepth parameter -->
  <xsl:choose>
    <xsl:when test="($tocparam='' or $tocparam='default') and string-length(translate($number,'.ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890&#167;','.')) &gt;= $parsedTocDepth">
      <!-- dropped entry because excluded -->
      <xsl:attribute name="class">tocline2</xsl:attribute>
    </xsl:when>
    <xsl:when test="$tocparam='exclude'">
      <!-- dropped entry because excluded -->
      <xsl:attribute name="class">tocline2</xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="starts-with($number,'del-')">
          <del>
            <xsl:value-of select="$number" />
            <a href="#{$target}"><xsl:value-of select="$title"/></a>
          </del>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="not(contains($number,'.'))">
              <xsl:attribute name="class">tocline0</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="class">tocline1</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="$number != ''">
            <xsl:call-template name="emit-section-number">
              <xsl:with-param name="no" select="$number"/>
            </xsl:call-template>
            <xsl:text>&#160;&#160;&#160;</xsl:text>
          </xsl:if>
          <a href="#{$target}"><xsl:value-of select="$title"/></a>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="back" mode="toc">

  <!-- <xsl:apply-templates select="references" mode="toc" /> -->

  <xsl:if test="//cref and $xml2rfc-comments='yes' and $xml2rfc-inline!='yes'">
    <li>
      <xsl:call-template name="insert-toc-line">
        <xsl:with-param name="target" select="concat($anchor-prefix,'.comments')"/>
        <xsl:with-param name="title" select="'Editorial Comments'"/>
      </xsl:call-template>
    </li>
  </xsl:if>

  <xsl:if test="$xml2rfc-ext-authors-section!='end'">
    <xsl:apply-templates select="/rfc/front" mode="toc" />
  </xsl:if>
  <xsl:apply-templates select="*[not(self::references)]" mode="toc" />

  <xsl:if test="$xml2rfc-ext-authors-section='end'">
    <xsl:apply-templates select="/rfc/front" mode="toc" />
  </xsl:if>

  <!-- copyright statements -->
  <xsl:if test="not($xml2rfc-private)">
    <li>
      <xsl:call-template name="insert-toc-line">
        <xsl:with-param name="target" select="concat($anchor-prefix,'.ipr')"/>
        <xsl:with-param name="title" select="'Intellectual Property and Copyright Statements'"/>
      </xsl:call-template>
    </li>
  </xsl:if>
  
  <!-- insert the index if index entries exist -->
  <xsl:if test="//iref">
    <li>
      <xsl:call-template name="insert-toc-line">
        <xsl:with-param name="target" select="concat($anchor-prefix,'.index')"/>
        <xsl:with-param name="title" select="'Index'"/>
      </xsl:call-template>
    </li>
  </xsl:if>

</xsl:template>

<xsl:template match="front" mode="toc">

  <xsl:variable name="title">
    <xsl:call-template name="get-authors-section-title"/>
  </xsl:variable>
  
  <li>
    <xsl:call-template name="insert-toc-line">
      <xsl:with-param name="target" select="concat($anchor-prefix,'.authors')"/>
      <xsl:with-param name="title" select="$title"/>
    </xsl:call-template>
  </li>

</xsl:template>

<xsl:template name="references-toc">

  <!-- distinguish two cases: (a) single references element (process
  as toplevel section; (b) multiple references sections (add one toplevel
  container with subsection) -->

  <xsl:choose>
    <xsl:when test="count(/*/back/references) = 0">
      <!-- nop -->
    </xsl:when>
    <xsl:when test="count(/*/back/references) = 1">
      <xsl:for-each select="/*/back/references">
        <xsl:variable name="title">
          <xsl:choose>
            <xsl:when test="@title!=''"><xsl:value-of select="@title" /></xsl:when>
            <xsl:otherwise>References</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
      
        <li>
          <xsl:call-template name="insert-toc-line">
            <xsl:with-param name="number">
              <xsl:call-template name="get-references-section-number"/>
            </xsl:with-param>
            <xsl:with-param name="target" select="concat($anchor-prefix,'.references')"/>
            <xsl:with-param name="title" select="$title"/>
          </xsl:call-template>
        </li>
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <li>
        <!-- insert pseudo container -->    
        <xsl:call-template name="insert-toc-line">
          <xsl:with-param name="number">
            <xsl:call-template name="get-references-section-number"/>
          </xsl:with-param>
          <xsl:with-param name="target" select="concat($anchor-prefix,'.references')"/>
          <xsl:with-param name="title" select="'References'"/>
        </xsl:call-template>
  
        <ul class="toc">
          <!-- ...with subsections... -->    
          <xsl:for-each select="/*/back/references">
            <xsl:variable name="title">
              <xsl:choose>
                <xsl:when test="@title!=''"><xsl:value-of select="@title" /></xsl:when>
                <xsl:otherwise>References</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
          
            <xsl:variable name="sectionNumber">
              <xsl:call-template name="get-section-number" />
            </xsl:variable>
    
            <xsl:variable name="num">
              <xsl:number/>
            </xsl:variable>
    
            <li>
              <xsl:call-template name="insert-toc-line">
                <xsl:with-param name="number" select="$sectionNumber"/>
                <xsl:with-param name="target" select="concat($anchor-prefix,'.references','.',$num)"/>
                <xsl:with-param name="title" select="$title"/>
              </xsl:call-template>
            </li>
          </xsl:for-each>
        </ul>
      </li>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="section" mode="toc">
  <xsl:variable name="sectionNumber">
    <xsl:call-template name="get-section-number" />
  </xsl:variable>

  <xsl:variable name="target">
    <xsl:choose>
      <xsl:when test="@anchor"><xsl:value-of select="@anchor" /></xsl:when>
       <xsl:otherwise><xsl:value-of select="$anchor-prefix"/>.section.<xsl:value-of select="$sectionNumber" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <li>
    <xsl:call-template name="insert-toc-line">
      <xsl:with-param name="number" select="$sectionNumber"/>
      <xsl:with-param name="target" select="$target"/>
      <xsl:with-param name="title" select="@title"/>
      <xsl:with-param name="tocparam" select="@toc"/>
    </xsl:call-template>
  
    <xsl:if test=".//section">
      <ul class="toc">
        <xsl:apply-templates mode="toc" />
      </ul>
    </xsl:if>
  </li>
</xsl:template>

<xsl:template match="middle" mode="toc">
  <xsl:apply-templates mode="toc" />
  <xsl:call-template name="references-toc" />
</xsl:template>

<xsl:template match="rfc" mode="toc">
  <xsl:apply-templates select="middle|back" mode="toc" />
</xsl:template>

<xsl:template match="ed:del|ed:ins|ed:replace" mode="toc">
  <xsl:apply-templates mode="toc" />
</xsl:template>

<xsl:template match="*|text()" mode="toc" />


<xsl:template name="insertTocAppendix">
  
  <xsl:if test="//figure[@title!='' or @anchor!='']">
    <ul class="toc">
      <xsl:for-each select="//figure[@title!='' or @anchor!='']">
        <xsl:variable name="title">Figure <xsl:value-of select="position()"/><xsl:if test="@title">: <xsl:value-of select="@title"/></xsl:if>
        </xsl:variable>
        <li>
          <xsl:call-template name="insert-toc-line">
            <xsl:with-param name="target" select="concat($anchor-prefix,'.figure.',position())" />
            <xsl:with-param name="title" select="$title" />
          </xsl:call-template>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:if>
  
  <!-- experimental -->
  <xsl:if test="//ed:issue">
    <xsl:call-template name="insertIssuesList" />
  </xsl:if>

</xsl:template>

<xsl:template name="referencename">
  <xsl:param name="node" />
  <xsl:choose>
    <xsl:when test="$xml2rfc-symrefs='yes'">[<xsl:value-of select="$node/@anchor" />]</xsl:when>
    <xsl:otherwise><xsl:for-each select="$node">[<xsl:number level="any" />]</xsl:for-each></xsl:otherwise>
  </xsl:choose>
</xsl:template>



<xsl:template name="replace-substring">

  <xsl:param name="string" />
  <xsl:param name="replace" />
  <xsl:param name="by" />

  <xsl:choose>
    <xsl:when test="contains($string,$replace)">
      <xsl:value-of select="concat(substring-before($string, $replace),$by)" />
      <xsl:call-template name="replace-substring">
        <xsl:with-param name="string" select="substring-after($string,$replace)" />
        <xsl:with-param name="replace" select="$replace" />
        <xsl:with-param name="by" select="$by" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$string" /></xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template name="rfclist">
  <xsl:param name="list" />
  <xsl:choose>
    <xsl:when test="contains($list,',')">
      <xsl:variable name="rfcNo" select="substring-before($list,',')" />
      <a href="{concat($rfcUrlPrefix,$rfcNo,'.txt')}"><xsl:value-of select="$rfcNo" /></a>,
      <xsl:call-template name="rfclist">
        <xsl:with-param name="list" select="normalize-space(substring-after($list,','))" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="rfcNo" select="$list" />
      <a href="{concat($rfcUrlPrefix,$rfcNo,'.txt')}"><xsl:value-of select="$rfcNo" /></a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="rfclist-for-dcmeta">
  <xsl:param name="list" />
  <xsl:choose>
    <xsl:when test="contains($list,',')">
      <xsl:variable name="rfcNo" select="substring-before($list,',')" />
      <meta name="DC.Relation.Replaces" content="urn:ietf:rfc:{$rfcNo}" />
      <xsl:call-template name="rfclist-for-dcmeta">
        <xsl:with-param name="list" select="normalize-space(substring-after($list,','))" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="rfcNo" select="$list" />
      <meta name="DC.Relation.Replaces" content="urn:ietf:rfc:{$rfcNo}" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-paragraph-number">
  <!-- get section number of ancestor section element, then add t or figure number -->
  <xsl:if test="ancestor::section and not(ancestor::section[@myns:unnumbered='unnumbered'])">
    <xsl:for-each select="ancestor::section[1]"><xsl:call-template name="get-section-number" />.p.</xsl:for-each><xsl:number count="t|figure" />
  </xsl:if>
</xsl:template>

<xsl:template name="editingMark">
  <xsl:if test="$xml2rfc-editing='yes' and ancestor::rfc">
    <sup class="editingmark"><span><xsl:number level="any" count="postamble|preamble|t"/></span>&#0160;</sup>
  </xsl:if>
</xsl:template>

<!-- experimental annotation support -->

<xsl:template match="ed:issue">
  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="@status='closed'">closedissue</xsl:when>
      <xsl:otherwise>openissue</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <table summary="issue {@name}" class="{$class}">
    <tr>
      <td colspan="3">
        <a name="{$anchor-prefix}.issue.{@name}">
          <xsl:choose>
            <xsl:when test="@status='closed'">
              <xsl:attribute name="class">closed-issue</xsl:attribute>
            </xsl:when>
            <xsl:when test="@status='editor'">
              <xsl:attribute name="class">editor-issue</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="class">open-issue</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>&#160;I&#160;</xsl:text>
        </a>
        <xsl:text>&#160;</xsl:text>
        <xsl:choose>
          <xsl:when test="@href">
            <em><a href="{@href}"><xsl:value-of select="@name" /></a></em>
          </xsl:when>
          <xsl:otherwise>
            <em><xsl:value-of select="@name" /></em>
          </xsl:otherwise>
        </xsl:choose>
        &#0160;
        (type: <xsl:value-of select="@type"/>, status: <xsl:value-of select="@status"/>)
      </td>
    </tr>
    <xsl:for-each select="ed:item">
      <tr>
        <td class="top">
          <a href="mailto:{@entered-by}?subject={/rfc/@docName}, {../@name}"><i><xsl:value-of select="@entered-by"/></i></a>
        </td>
        <td class="topnowrap">
          <xsl:value-of select="@date"/>
        </td>
        <td class="top">
          <xsl:call-template name="copynodes">
            <xsl:with-param name="nodes" select="node()" />
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="ed:resolution">
      <tr>
        <td class="top">
          <xsl:if test="@entered-by">
            <a href="mailto:{@entered-by}?subject={/rfc/@docName}, {../@name}"><i><xsl:value-of select="@entered-by"/></i></a>
          </xsl:if>
        </td>
        <td class="topnowrap">
          <xsl:value-of select="@datetime"/>
        </td>
        <td class="top">
          <em>Resolution:</em>&#0160;<xsl:copy-of select="node()" />
        </td>
      </tr>
    </xsl:for-each>
    <xsl:variable name="changes" select="//*[@ed:resolves=current()/@name or ed:resolves=current()/@name]" />
    <xsl:if test="$changes">
      <tr>
        <td class="top" colspan="3">
          Associated changes in this document:
          <xsl:variable name="issue" select="@name"/>
          <xsl:for-each select="$changes">
            <a href="#{$anchor-prefix}.change.{$issue}.{position()}">
              <xsl:variable name="label">
                <xsl:call-template name="get-section-number"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$label!=''"><xsl:value-of select="$label"/></xsl:when>
                <xsl:otherwise>&lt;<xsl:value-of select="concat('#',$anchor-prefix,'.change.',$issue,'.',position())"/>&gt;</xsl:otherwise>
              </xsl:choose>
            </a>
            <xsl:if test="position()!=last()">, </xsl:if>
          </xsl:for-each>
          <xsl:text>.</xsl:text>
        </td>
      </tr>
    </xsl:if>
  </table>
    
</xsl:template>

<xsl:template name="insertIssuesList">

  <h2><a name="{$anchor-prefix}.issues-list" href="#{$anchor-prefix}.issues-list">Issues list</a></h2>
  <table summary="Issues list">
    <xsl:for-each select="//ed:issue">
      <xsl:sort select="@status" />
      <xsl:sort select="@name" />
      <tr>
        <td><a href="#{$anchor-prefix}.issue.{@name}"><xsl:value-of select="@name" /></a></td>
        <td><xsl:value-of select="@type" /></td>
        <td><xsl:value-of select="@status" /></td>
        <td><xsl:value-of select="ed:item[1]/@date" /></td>
        <td><a href="mailto:{ed:item[1]/@entered-by}?subject={/rfc/@docName}, {@name}"><xsl:value-of select="ed:item[1]/@entered-by" /></a></td>
      </tr>
    </xsl:for-each>
  </table>
  
</xsl:template>

<xsl:template name="formatTitle">
  <xsl:if test="@who">
    <xsl:value-of select="@who" />
  </xsl:if>
  <xsl:if test="@datetime">
    <xsl:value-of select="concat(' (',@datetime,')')" />
  </xsl:if>
  <xsl:if test="@reason">
    <xsl:value-of select="concat(': ',@reason)" />
  </xsl:if>
  <xsl:if test="@cite">
    <xsl:value-of select="concat(' &lt;',@cite,'&gt;')" />
  </xsl:if>
</xsl:template>

<xsl:template name="insert-diagnostics">
  
  <!-- check anchor names -->
  <xsl:variable name="badAnchors" select="//*[starts-with(@anchor,concat($anchor-prefix,'.'))]" />
  <xsl:if test="$badAnchors">
    <p class="warning">
      The following anchor names may collide with internally generated anchors because of their prefix "<xsl:value-of select="$anchor-prefix" />":
      <xsl:for-each select="$badAnchors">
        <xsl:value-of select="@anchor"/><xsl:if test="position()!=last()">, </xsl:if>
      </xsl:for-each>
    </p>
    <xsl:message>
      The following anchor names may collide with internally generated anchors because of their prefix "<xsl:value-of select="$anchor-prefix" />":
      <xsl:for-each select="$badAnchors">
        <xsl:value-of select="@anchor"/><xsl:if test="position()!=last()">, </xsl:if>
      </xsl:for-each>
    </xsl:message>
  </xsl:if>
  
  <!-- check IDs -->
  <xsl:variable name="badTargets" select="//xref[not(@target=//@anchor) and not(ancestor::ed:del)]" />
  <xsl:if test="$badTargets">
    <p class="error">
      The following target names do not exist:
      <xsl:for-each select="$badTargets">
        <xsl:value-of select="@target"/><xsl:if test="position()!=last()">, </xsl:if>
      </xsl:for-each>
    </p>
    <xsl:message>
      The following target names do not exist:
      <xsl:for-each select="$badTargets">
        <xsl:value-of select="@target"/><xsl:if test="position()!=last()">, </xsl:if>
      </xsl:for-each>
    </xsl:message>
  </xsl:if>
 
  
</xsl:template>

<!-- special change mark support, not supported by RFC2629 yet -->

<xsl:template match="@ed:*" />

<xsl:template match="ed:del">
  <xsl:call-template name="insert-issue-pointer"/>
  <del>
    <xsl:copy-of select="@*[namespace-uri()='']"/>
    <xsl:if test="not(@title) and ancestor-or-self::*[@ed:entered-by] and @datetime">
      <xsl:attribute name="title"><xsl:value-of select="concat(@datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates />
  </del>
</xsl:template>

<xsl:template match="ed:ins">
  <xsl:call-template name="insert-issue-pointer"/>
  <ins>
    <xsl:copy-of select="@*[namespace-uri()='']"/>
    <xsl:if test="not(@title) and ancestor-or-self::*[@ed:entered-by] and @datetime">
      <xsl:attribute name="title"><xsl:value-of select="concat(@datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates />
  </ins>
</xsl:template>

<xsl:template name="insert-issue-pointer">
  <xsl:variable name="change" select="."/>
  <xsl:for-each select="@ed:resolves|ed:resolves">
    <xsl:variable name="resolves" select="."/>
    <!-- need the right context node for proper numbering -->
    <xsl:variable name="count"><xsl:for-each select=".."><xsl:number level="any" count="*[@ed:resolves=$resolves or ed:resolves=$resolves]" /></xsl:for-each></xsl:variable>
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="$anchor-prefix"/>.change.<xsl:value-of select="$resolves"/>.<xsl:value-of select="$count" />
      </xsl:attribute>
    </a>
    <xsl:choose>
      <xsl:when test="not(ancestor::t)">
        <div style="float: left;">
          <a class="open-issue" href="#{$anchor-prefix}.issue.{$resolves}" title="resolves: {$resolves}">
            <xsl:choose>
              <xsl:when test="//ed:issue[@name=$resolves and @status='closed']">
                <xsl:attribute name="class">closed-issue noprint</xsl:attribute>
              </xsl:when>
              <xsl:when test="//ed:issue[@name=$resolves and @status='editor']">
                <xsl:attribute name="class">editor-issue noprint</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="class">open-issue noprint</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#160;I&#160;</xsl:text>
          </a>
          <xsl:text>&#160;</xsl:text>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <a class="open-issue" href="#{$anchor-prefix}.issue.{$resolves}" title="resolves: {$resolves}">
          <xsl:choose>
            <xsl:when test="//ed:issue[@name=$resolves and @status='closed']">
              <xsl:attribute name="class">closed-issue noprint</xsl:attribute>
            </xsl:when>
            <xsl:when test="//ed:issue[@name=$resolves and @status='editor']">
              <xsl:attribute name="class">editor-issue noprint</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="class">open-issue noprint</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>&#160;I&#160;</xsl:text>
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<xsl:template match="ed:replace">
  <xsl:if test="@cite">
    <a class="editor-issue" href="{@cite}" target="_blank" title="see {@cite}">
      <xsl:text>&#160;i&#160;</xsl:text>
    </a>
  </xsl:if>
  <xsl:call-template name="insert-issue-pointer"/>
  <xsl:if test="ed:del">
    <del>
      <xsl:copy-of select="@*[namespace-uri()='']"/>
      <xsl:if test="not(@title) and ancestor-or-self::*[@ed:entered-by] and @datetime">
        <xsl:attribute name="title"><xsl:value-of select="concat(@datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="ed:del/node()" />
    </del>
  </xsl:if>
  <xsl:if test="ed:ins">
    <ins>
      <xsl:copy-of select="@*[namespace-uri()='']"/>
      <xsl:if test="not(@title) and ancestor-or-self::*[@ed:entered-by] and @datetime">
        <xsl:attribute name="title"><xsl:value-of select="concat(@datetime,', ',ancestor-or-self::*[@ed:entered-by][1]/@ed:entered-by)"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="ed:ins/node()" />
    </ins>
  </xsl:if>
</xsl:template>

<!-- convenience template for helping Mozilla (pre/ins inheritance problem) -->
<xsl:template name="insertInsDelClass">
  <xsl:if test="ancestor::ed:del">
    <xsl:attribute name="class">del</xsl:attribute>
  </xsl:if>
  <xsl:if test="ancestor::ed:ins">
    <xsl:attribute name="class">ins</xsl:attribute>
  </xsl:if>
</xsl:template>


<xsl:template name="sectionnumberAndEdits">
  <xsl:choose>
    <xsl:when test="ancestor::ed:del">del-<xsl:number count="ed:del//section" level="any"/></xsl:when>
    <xsl:when test="self::section and parent::ed:ins and local-name(../..)='replace'">
      <xsl:for-each select="../.."><xsl:call-template name="sectionnumberAndEdits" /></xsl:for-each>
      <xsl:for-each select="..">
        <xsl:if test="parent::ed:replace">
          <xsl:for-each select="..">
            <xsl:if test="parent::section">.</xsl:if><xsl:value-of select="1+count(preceding-sibling::section|preceding-sibling::ed:ins/section|preceding-sibling::ed:replace/ed:ins/section)" />
          </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
    </xsl:when>
    <xsl:when test="self::section[parent::ed:ins]">
      <xsl:for-each select="../.."><xsl:call-template name="sectionnumberAndEdits" /></xsl:for-each>
      <xsl:for-each select="..">
        <xsl:if test="parent::section">.</xsl:if><xsl:value-of select="1+count(preceding-sibling::section|preceding-sibling::ed:ins/section|preceding-sibling::ed:replace/ed:ins/section)" />
      </xsl:for-each>
    </xsl:when>
    <xsl:when test="self::section">
      <xsl:for-each select=".."><xsl:call-template name="sectionnumberAndEdits" /></xsl:for-each>
      <xsl:if test="parent::section">.</xsl:if>
      <xsl:choose>
        <xsl:when test="parent::back">
          <xsl:number format="A" value="1+count(preceding-sibling::section|preceding-sibling::ed:ins/section|preceding-sibling::ed:replace/ed:ins/section)" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:number value="1+count(preceding-sibling::section|preceding-sibling::ed:ins/section|preceding-sibling::ed:replace/ed:ins/section)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="self::references">
      <xsl:choose>
        <xsl:when test="count(/*/back/references)=1"><xsl:call-template name="get-references-section-number"/></xsl:when>
        <xsl:otherwise><xsl:call-template name="get-references-section-number"/>.<xsl:number/></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="self::middle or self::back"><!-- done --></xsl:when>
    <xsl:otherwise>
      <!-- go up one level -->
      <xsl:for-each select=".."><xsl:call-template name="sectionnumberAndEdits" /></xsl:for-each>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- table formatting -->

<xsl:template match="texttable">
  <xsl:apply-templates select="preamble" />
  <table summary="{preamble}" border="1" cellpadding="3" cellspacing="0">
    <thead>
      <tr>
        <xsl:apply-templates select="ttcol" />
      </tr>
    </thead>
    <tbody>
      <xsl:variable name="columns" select="count(ttcol)" />
      <xsl:for-each select="c[(position() mod $columns) = 1]">
        <tr>
          <xsl:for-each select=". | following-sibling::c[position() &lt; $columns]">
            <td class="top">
              <xsl:variable name="pos" select="position()" />
              <xsl:variable name="col" select="../ttcol[position() = $pos]" />
              <xsl:if test="$col/@align">
                <xsl:attribute name="style">text-align: <xsl:value-of select="$col/@align" />;</xsl:attribute>
              </xsl:if>
              <xsl:apply-templates select="node()" />
              <xsl:text>&#0160;</xsl:text>
            </td>
          </xsl:for-each>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
  <xsl:apply-templates select="postamble" />
</xsl:template>

<xsl:template match="ttcol">
  <th valign="top">
    <xsl:variable name="width">
      <xsl:if test="@width">width: <xsl:value-of select="@width" />; </xsl:if>
    </xsl:variable>
    <xsl:variable name="align">
      <xsl:choose>
        <xsl:when test="@align">text-align: <xsl:value-of select="@align" />;</xsl:when>
        <xsl:otherwise>text-align: left;</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="style"><xsl:value-of select="concat($width,$align)" /></xsl:attribute>
    <xsl:apply-templates />
  </th>
</xsl:template>

<!-- cref support -->

<xsl:template match="cref">
  <xsl:if test="$xml2rfc-comments!='no'">
    <xsl:variable name="cid">
      <xsl:choose>
        <xsl:when test="@anchor">
          <xsl:value-of select="@anchor"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$anchor-prefix"/>
          <xsl:text>.comment.</xsl:text>
          <xsl:number count="cref[not(@anchor)]" level="any"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <span class="comment">
      <xsl:if test="$xml2rfc-inline!='yes'">
        <xsl:attribute name="title">
          <xsl:if test="@source"><xsl:value-of select="@source"/>: </xsl:if>
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:if>
      <xsl:text>[</xsl:text>
      <xsl:choose>
        <xsl:when test="$xml2rfc-inline='yes'">
          <xsl:value-of select="$cid"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="."/>
          <xsl:if test="@source"> --<xsl:value-of select="@source"/></xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <a href="#{$cid}">
            <xsl:value-of select="$cid"/>
          </a>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>]</xsl:text>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template name="insertComments">

  <xsl:call-template name="insert-conditional-hrule"/>
    
  <h1>
    <xsl:call-template name="insert-conditional-pagebreak"/>
    <a name="{$anchor-prefix}.comments">Editorial Comments</a>
  </h1>

  <dl>
    <xsl:for-each select="//cref">
      <xsl:variable name="cid">
        <xsl:choose>
          <xsl:when test="@anchor">
            <xsl:value-of select="@anchor"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$anchor-prefix"/>
            <xsl:text>.comment.</xsl:text>
            <xsl:number count="cref[not(@anchor)]" level="any"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <dt>
        <xsl:if test="$xml2rfc-inline!='yes'">
          <a name="{$cid}"/>
        </xsl:if>
        [<xsl:value-of select="$cid"/>]
      </dt>
      <dd>
        <xsl:value-of select="."/>
        <xsl:if test="@source"> --<xsl:value-of select="@source"/></xsl:if>
      </dd>
    </xsl:for-each>
  </dl>
</xsl:template>


<!-- Chapter Link Generation -->

<xsl:template match="*" mode="links"><xsl:apply-templates mode="links"/></xsl:template>
<xsl:template match="text()" mode="links" />

<xsl:template match="/*/middle//section[not(myns:unnumbered) and not(ancestor::section)]" mode="links">
  <xsl:variable name="sectionNumber"><xsl:call-template name="get-section-number" /></xsl:variable>
  <link rel="Chapter" title="{$sectionNumber} {@title}" href="#{$anchor-prefix}.section.{$sectionNumber}" />
  <xsl:apply-templates mode="links" />
</xsl:template>

<xsl:template match="/*/back//section[not(myns:unnumbered) and not(ancestor::section)]" mode="links">
  <xsl:variable name="sectionNumber"><xsl:call-template name="get-section-number" /></xsl:variable>
  <link rel="Appendix" title="{$sectionNumber} {@title}" href="#{$anchor-prefix}.section.{$sectionNumber}" />
  <xsl:apply-templates mode="links" />
</xsl:template>

<xsl:template match="/*/back/references[position()=1]" mode="links">
  <xsl:variable name="sectionNumber"><xsl:call-template name="get-references-section-number" /></xsl:variable>
  <link rel="Chapter" href="#{$anchor-prefix}.section.{$sectionNumber}">
    <xsl:choose>
      <xsl:when test="@title and count(/*/back/references)=1">
        <xsl:attribute name="title">
          <xsl:call-template name="get-references-section-number"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="@title"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="title">
          <xsl:call-template name="get-references-section-number"/>
          <xsl:text> References</xsl:text>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </link>
</xsl:template>

<!-- convenience templates -->

<xsl:template name="get-author-summary">
  <xsl:choose>
    <xsl:when test="count(/rfc/front/author)=1">
      <xsl:value-of select="/rfc/front/author[1]/@surname" />
    </xsl:when>
    <xsl:when test="count(/rfc/front/author)=2">
      <xsl:value-of select="concat(/rfc/front/author[1]/@surname,' &amp; ',/rfc/front/author[2]/@surname)" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat(/rfc/front/author[1]/@surname,', et al.')" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-authors">
  <xsl:for-each select="/rfc/front/author">
    <xsl:value-of select="@fullname" />
    <xsl:if test="position()!=last()">, </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="get-category-long">
  <xsl:choose>
    <xsl:when test="$xml2rfc-footer"><xsl:value-of select="$xml2rfc-footer" /></xsl:when>
    <xsl:when test="$xml2rfc-private"/> <!-- private draft, footer not set -->
    <xsl:when test="/rfc/@category='bcp'">Best Current Practice</xsl:when>
    <xsl:when test="/rfc/@category='historic'">Historic</xsl:when>
    <xsl:when test="/rfc/@category='info' or not(/rfc/@category)">Informational</xsl:when>
    <xsl:when test="/rfc/@category='std'">Standards Track</xsl:when>
    <xsl:when test="/rfc/@category='exp'">Experimental</xsl:when>
    <xsl:otherwise>(category unknown)</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-header-center">
  <xsl:choose>
    <xsl:when test="string-length(/rfc/front/title/@abbrev) &gt; 0">
      <xsl:value-of select="/rfc/front/title/@abbrev" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="/rfc/front/title" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-header-left">
  <xsl:choose>
    <xsl:when test="$xml2rfc-header"><xsl:value-of select="$xml2rfc-header" /></xsl:when>
    <xsl:when test="$xml2rfc-private"/> <!-- private draft, header not set -->
    <xsl:when test="/rfc/@ipr">INTERNET DRAFT</xsl:when>
    <xsl:otherwise>RFC <xsl:value-of select="/rfc/@number"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-generator">
  <xsl:variable name="gen">
    <xsl:text>http://greenbytes.de/tech/webdav/rfc2629.xslt, </xsl:text>
    <!-- when RCS keyword substitution in place, add version info -->
    <xsl:if test="contains('$Revision: 1.220 $',':')">
      <xsl:value-of select="concat('Revision ',normalize-space(translate(substring-after('$Revision: 1.220 $', 'Revision: '),'$','')),', ')" />
    </xsl:if>
    <xsl:if test="contains('$Date: 2005/04/11 11:37:53 $',':')">
      <xsl:value-of select="concat(normalize-space(translate(substring-after('$Date: 2005/04/11 11:37:53 $', 'Date: '),'$','')),', ')" />
    </xsl:if>
    <xsl:value-of select="concat('XSLT vendor: ',system-property('xsl:vendor'),' ',system-property('xsl:vendor-url'))" />
  </xsl:variable>
  <xsl:value-of select="$gen" />
</xsl:template>

<xsl:template name="get-header-right">
  <xsl:value-of select="concat(/rfc/front/date/@month,' ',/rfc/front/date/@year)" />
</xsl:template>

<xsl:template name="get-keywords">
  <xsl:variable name="keyw">
    <xsl:for-each select="/rfc/front/keyword">
      <xsl:value-of select="translate(.,',',' ')" />
      <xsl:if test="position()!=last()">, </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:value-of select="normalize-space($keyw)" />
</xsl:template>

<!-- get language from context node. nearest ancestor or return the default of "en" -->
<xsl:template name="get-lang">
  <xsl:choose>
    <xsl:when test="ancestor-or-self::*[@xml:lang]"><xsl:value-of select="ancestor-or-self::*/@xml:lang" /></xsl:when>
    <xsl:otherwise>en</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-section-number">
  <xsl:variable name="hasEdits" select="count(//ed:del|//ed:ins)!=0" />
  <xsl:choose>
    <xsl:when test="$hasEdits">
      <xsl:call-template name="sectionnumberAndEdits" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="self::references">
          <xsl:choose>
            <xsl:when test="count(/*/back/references)=1">
              <xsl:call-template name="get-references-section-number"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="get-references-section-number"/>.<xsl:number count="references"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="ancestor::back"><xsl:number count="section|appendix" level="multiple" format="A.1.1.1.1.1.1.1" /></xsl:when>
        <xsl:when test="self::appendix"><xsl:number count="appendix" level="multiple" format="A.1.1.1.1.1.1.1" /></xsl:when>
        <xsl:otherwise><xsl:number count="section" level="multiple"/></xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- get the section number for the references section -->
<xsl:template name="get-references-section-number">
  <xsl:value-of select="count(/rfc/middle/section) + 1"/>
</xsl:template>

<xsl:template name="emit-section-number">
  <xsl:param name="no"/>
  <xsl:value-of select="$no"/><xsl:if test="not(contains($no,'.')) or $xml2rfc-ext-sec-no-trailing-dots='yes'">.</xsl:if>
</xsl:template>

<xsl:template name="get-section-type">
  <xsl:param name="prec" />
  <xsl:choose>
    <xsl:when test="ancestor::back">Appendix</xsl:when>
    <xsl:otherwise>Section</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="insert-conditional-pagebreak">
  <xsl:if test="$xml2rfc-compact!='yes'">
    <xsl:attribute name="class">np</xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template name="insert-conditional-hrule">
  <xsl:if test="$xml2rfc-compact!='yes'">
    <hr class="noprint" />
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
