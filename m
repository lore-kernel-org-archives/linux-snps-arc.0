Return-Path: <SRS0=wFQm=GZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95D0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 Jan 2021 14:10:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F6B23AA9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 Jan 2021 14:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F6B23AA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4DA+ouNUzLI9dP68aTK0CmxDDoU0NVaid7fH3UkXy4=; b=OjNmCbp9q62J+mu3nJLYmxTq+
	ZmCLUxTiNaLFu9JJwxd6kFJlolFR27qCL2NBRpq89rX6PrtWkpkYjlIWFP/LuWcgKsbPToz1T+EVO
	yUJM+HZZm/bOlizA9Yq6+QRJMpi4lPMcfP1fK11IXS8ZxJ1CzVBccSEWcqZ4xGpR4elJohga6ryvr
	4YnJsimvXgEtinrwE36Hkx7cJoJWBux5aHjbiCF19R+cCKGDBkNDqiaKcwSS7TU3Ol0UvBB61rRrm
	JRjIaHYifT7xkFYdytfGBHfuGOusztdmYu0iCzD5iSRLoyjxkyoIkP3z23M58tPFFPxM05pPBtbmm
	+GfUL3/IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2x9F-0004GA-Qh; Fri, 22 Jan 2021 14:10:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2x9D-0004FC-8S
 for linux-snps-arc@lists.infradead.org; Fri, 22 Jan 2021 14:10:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5364E23AA3;
 Fri, 22 Jan 2021 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611324646;
 bh=zPb3uoCMpMg0zIdBDDDosH3CoWb00JMVhzJ0D614Sfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u83cQdirnwFeD9/ilIBOM6VMOBOesrM++RGq45UGlM8dl4Cs0PsMUNWKcWWMdjIDy
 7HpOe+X+zuGvV+lPjHPePjD7dm1Cegb0f/hdywddkJlUkEaehyb9VI2R/rah0gndIY
 jK9XPJRg5YwsDCNhfyQ769+Xm8dCS+vIqahFb18A=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.9 10/35] arch/arc: add copy_user_page() to <asm/page.h> to
 fix build error on ARC
Date: Fri, 22 Jan 2021 15:10:12 +0100
Message-Id: <20210122135732.747017067@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210122135732.357969201@linuxfoundation.org>
References: <20210122135732.357969201@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_091047_484906_8FF67B9B 
X-CRM114-Status: GOOD (  12.40  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Jan Kara <jack@suse.cz>,
 kernel test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, stable@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-fsdevel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-snps-arc@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 8a48c0a3360bf2bf4f40c980d0ec216e770e58ee ]

fs/dax.c uses copy_user_page() but ARC does not provide that interface,
resulting in a build error.

Provide copy_user_page() in <asm/page.h>.

../fs/dax.c: In function 'copy_cow_page_dax':
../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: Dan Williams <dan.j.williams@intel.com>
#Acked-by: Vineet Gupta <vgupta@synopsys.com> # v1
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-nvdimm@lists.01.org
#Reviewed-by: Ira Weiny <ira.weiny@intel.com> # v2
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/include/asm/page.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index ffb5f33475f19..f0f43eb709d2f 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 
 #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
+#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 #define copy_page(to, from)		memcpy((to), (from), PAGE_SIZE)
 
 struct vm_area_struct;
-- 
2.27.0




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
