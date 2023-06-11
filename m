Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB62C7EE45
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOIiy79zjjYXMXPhiA0csXT8R8y3uDSmoa63OyglrnU=; b=nEdUtNBpoAhuZs
	AOMQcg0LX+vQ7LEawOGyeqyGlSaPiMRXCLR6jNWhdSn/sn8UU3zMWMW6TBqhK/K2sc+1stAh7iIAr
	XH374pmbwHwmWhc3av7o9U8NNK8OTdu0QzCbXNCOUbuOl3MEAaMfTM3K85k1yq4GenhM6E4YL15UU
	eit7Jsv9ngndotq7HG7P3ERdlKTWLmCZNhYIRO7RjYVw3kqRJF8tdHhCuuZmhVwwxOhUA+jGW6DSS
	hPjIXHv/LV8qKPALsGHr9RI5mylLbleYelBCGBytYqQpajJZVeGqT5zL5CGbCjgaj2IUHx1yCqmf8
	1kaVfHa9pUDj0JObbgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLf-001GQs-1N;
	Sun, 11 Jun 2023 15:51:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLc-001GOx-1s
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 112C361CAE;
	Sun, 11 Jun 2023 15:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E852C4339E;
	Sun, 11 Jun 2023 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498679;
	bh=VKxHtXFVlcWySintpspJtZKTq9sWsgdCdx/RGyDBDos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kanvkj7vc+JNf9L9dC/ml1Ei1imjS+iSRoPVPi3XaubAJZJPZQQ59FLNWawZHz7lU
	 boBH/4xl0ydm+lO27FUbJv/6dFR25K4dEk8atubEvp4+3zR7EDb3GJSEoSLfdxq6mO
	 uaL4Z1ZRnC0d4k+Wj4s2rspD03XMA3B+VvPPjQQI2E5WQ3QH0jjBH4wV4/fLbMRXFj
	 19nFH9d3j/BG/s5HDKE6zwW4ICPM4oN7UXMLgkp7HgO+DZiZjb08/6az2CFuXvLua3
	 oXxd7SwYWswZYcZNEVbNK03/WR6UC0XFRHscO+rqVNVOsqYd4ppgjk+mMMKFWJYyTt
	 IN97rVMOevhdQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 06/11] modpost: squash sym_update_namespace() into sym_add_exported()
Date: Mon, 12 Jun 2023 00:50:55 +0900
Message-Id: <20230611155100.2553804-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085120_655169_5C41BD90 
X-CRM114-Status: GOOD (  13.06  )
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

Pass a set of the name, license, and namespace to sym_add_exported().

sym_update_namespace() is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

 scripts/mod/modpost.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 10da82ad5874..79ad0a346a5c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -355,26 +355,8 @@ static const char *sec_name(const struct elf_info *info, unsigned int secindex)
 
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 
-static void sym_update_namespace(const char *symname, const char *namespace)
-{
-	struct symbol *s = find_symbol(symname);
-
-	/*
-	 * That symbol should have been created earlier and thus this is
-	 * actually an assertion.
-	 */
-	if (!s) {
-		error("Could not update namespace(%s) for symbol %s\n",
-		      namespace, symname);
-		return;
-	}
-
-	free(s->namespace);
-	s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
-}
-
 static struct symbol *sym_add_exported(const char *name, struct module *mod,
-				       bool gpl_only)
+				       bool gpl_only, const char *namespace)
 {
 	struct symbol *s = find_symbol(name);
 
@@ -387,6 +369,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	s = alloc_symbol(name);
 	s->module = mod;
 	s->is_gpl_only = gpl_only;
+	s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
 	list_add_tail(&s->list, &mod->exported_symbols);
 	hash_add_symbol(s);
 
@@ -1236,8 +1219,7 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	}
 
 	data += strlen(data) + 1;	/* namespace */
-	s = sym_add_exported(name, mod, is_gpl);
-	sym_update_namespace(name, data);
+	s = sym_add_exported(name, mod, is_gpl, data);
 
 	/*
 	 * We need to be aware whether we are exporting a function or
@@ -2180,9 +2162,8 @@ static void read_dump(const char *fname)
 			mod = new_module(modname, strlen(modname));
 			mod->from_dump = true;
 		}
-		s = sym_add_exported(symname, mod, gpl_only);
+		s = sym_add_exported(symname, mod, gpl_only, namespace);
 		sym_set_crc(s, crc);
-		sym_update_namespace(symname, namespace);
 	}
 	free(buf);
 	return;
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
