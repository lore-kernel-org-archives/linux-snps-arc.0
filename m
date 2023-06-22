Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E599EB64DD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jun 2023 19:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XII9fG8aSj5fpmF7TW/Y1j/rbsRgvDRY8o1nwleO79s=; b=5CEWKwV6nt5Jd9
	0YAqOUqk0brgS830QjTLE2iDocVJfgyZua81ijDUyXDPTHCqPKVJkObkvYvaZDrQLTffNmyF4Tvdt
	fS2jvSZIU4GPF1YoF14duVyjXAq1atZbsEDZwm97CCngow3KUiXFKMq5xxHmDPJZEcZ8sl/aPwOe8
	2JKBuufYV26q/XNKmU2AXpMOivrBN3T/FD4x00PcXEtN/IoWQKBlN9YZBPr2SwBSCydS7jam7O7Ts
	xKsf5GJ8hKumrHTXWC8ESiGGV+EdAy0eVcJOURL4dC82/+0xcSmTM+GyeE6geGUfsCr0IptVOew5J
	T9cMXS7bne7bZBDneRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPqb-001Xtt-09;
	Thu, 22 Jun 2023 19:20:01 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPqX-001XtA-34
	for linux-snps-arc@lists.infradead.org;
	Thu, 22 Jun 2023 19:19:59 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id B210E320092A;
	Thu, 22 Jun 2023 15:19:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 22 Jun 2023 15:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1687461596; x=1687547996; bh=6+6r2jl0FgLMZhz62vz2TuajhsbnfKNl/0S
	YnIJgOYk=; b=cKc5M8i/kxkAd48cHUJPl/dMTVQeBtrTTPo3fcmtqYcNAoVtikC
	L66GZDOJ8ySjYAko8YPGVGDBaLQGFW8fxIgAgIyQ+AQIBfItHSJ6xo6DZQUNCemk
	4lirbqL5J/JiPmYEO8u6X3YAaU6/LHgkPub3hwi2Kz3+n7ZY8BSqyEI29V0tA6KR
	T0UDAdYPNyQXjvd/CoXvhAG2kNTZEME+ZW4MwxkmQytphbPk++lh8pdyPBYx/Zhk
	IOo71hSiLDCss0wuHwI2T00VBPgKycmlTkR7u+IAE2Qj9DXqv7xRt6d2jfOv+3L8
	Z/mi4gfNXHHkC4vl7Vo/JGbGo/fGMGoCvOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687461596; x=1687547996; bh=6+6r2jl0FgLMZ
	hz62vz2TuajhsbnfKNl/0SYnIJgOYk=; b=bdSACyKrfoSxEzz3j8tmMKJgKOTjs
	d1v5Y9JB8u4kRSXpc+LyIY88+HFfrr2YQ1yJ/6kUylSzPdA05Ist8JhhEa9QzKKE
	ytiJGk7wJBOmgDGlcnOJYy/onAbwc0Rr+bGTrHqKR0pcfPOWuOMuuJlo0e/y4GrR
	BcGQDp7ykjbhjB2ZtXERGpIOAEaCjmMVymHLDjzjK+pS+luFViTdK1Glm2ANHtCe
	8yhsepfIkjP06N5dMO4sDHYgAfnrFZGoF0TYksDKKHtwX+bpDVU4dxP/WvDYP9zQ
	niufq1rHAQG8mM6XcjRkI/DYBEf6MYQy7jvGjV/MIZnWTPvflm7chy71A==
X-ME-Sender: <xms:256UZNJgPtwKwtJFe8ePUMOdcV00ejlEdbW6WbcbC21IJVr411xY4Q>
    <xme:256UZJIBGnfSmui_3XbELMffei0asPNlRkjnpLIKbj1swFcCb-LWnN5c9rxZ_BwEX
    JcvXAaZL_iyj3Z4b5M>
X-ME-Received: <xmr:256UZFsvdBl-9fDTBU6BQurzYksmq_hnbxH0oceDiVyxtsFHPJSOdfEmLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhs
    hhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqne
    cuggftrfgrthhtvghrnhepvdekleffgfetfeeijedtieehtdeuhfegueejkeevueeileff
    gfduleffjeffuddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhr
    ihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:256UZOZXyw9mfSAiTP-_NotkHTTvaS-n4CJWRxrLzXgJXMvd6Npl7g>
    <xmx:256UZEbV2CJ1fEu1aKGeglboa7DlB4SgiC-zHd39mwspV8wx-GEM4A>
    <xmx:256UZCBPXneMptxjUXeHbPGqXg4lDvpql72i5rztHLo2SRP7eZxZ5Q>
    <xmx:3J6UZJOeLbPLbL1w77Sem6cLk8cFggj5w8HpjdHqK_GsAI5BFUNUvg>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jun 2023 15:19:54 -0400 (EDT)
Date: Thu, 22 Jun 2023 12:19:53 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: builddeb: always make modules_install, to install
 modules.builtin*
Message-ID: <f7e9220aad3d98bd174f7dcbd68031e1e15ea968.1687461492.git.josh@joshtriplett.org>
References: <20230615111743.883891-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615111743.883891-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_121958_025638_2578BABC 
X-CRM114-Status: GOOD (  10.92  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Even for a non-modular kernel, the kernel builds modules.builtin and
modules.builtin.modinfo, with information about the built-in modules.
Tools such as initramfs-tools need these files to build a working
initramfs on some systems, such as those requiring firmware.

Now that `make modules_install` works even in non-modular kernels and
installs these files, unconditionally invoke it when building a Debian
package.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---

This patch depends on
https://lore.kernel.org/lkml/20230615111743.883891-1-masahiroy@kernel.org/

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 252faaa5561c..f500e3910158 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -62,8 +62,8 @@ install_linux_image () {
 		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
 	fi
 
+	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" modules_install
 	if is_enabled CONFIG_MODULES; then
-		${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" modules_install
 		rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
 		rm -f "${pdir}/lib/modules/${KERNELRELEASE}/source"
 		if [ "${SRCARCH}" = um ] ; then
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
