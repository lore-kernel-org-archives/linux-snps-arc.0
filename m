Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFB4C41604
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:50:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E511720782
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3dKyCumA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E511720782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnoitU6goDhVNaJMgXCBJiN+7mxoav5bUz/dhB4WpQo=; b=3dKyCumALLl06S+uj5CVmBCjfI
	fw89TQNlQAl6T/7uPCh7QBTXK3EHob3QzOr9WuodV/O90oNQPSd5yw9NgmpPIuCkymCj43oslZ/Gu
	onF2qD1MYMy5ZmlR6MK3zjxfYDcfnsIvp6ZEoCdQn4Wztdfaq6nw7jS3FTmat0hbkKqDTZ2A7Vl9T
	5RVUtrneHd13L1Km+f001LcFoPLlZlTSJZQr8x8qpmBEn8rZKJP2BdfJ/RLQE6Oy/082l+rFXeRIu
	xM6wxEQwuQfpeP84uGP5rjHO7pkfJOlbscRqhkLubHBJMqqjKItYl3boabZRs7b3cdsXvdpeMRKig
	ORTg6t6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPevg-0008KF-6I; Tue, 06 Oct 2020 04:50:24 +0000
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPevb-0008JQ-K8; Tue, 06 Oct 2020 04:50:19 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC PATCH] DRM: amd: powerplay: don't undef pr_warn() {causes ARC
 build errors}
Message-ID: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
Date: Mon, 5 Oct 2020 21:50:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

arch/arc/ implements BUG_ON() with BUG(). ARC has its own BUG()
function and that function uses pr_warn() as part of its implementation.

Several (8) files in amd/powerplay/ #undef various pr_xyz() functions so
that they won't be used by these drivers, since dev_() functions are
preferred here and the #undefs make the pr_() functions unavailable.

Hence the following build errors are reported in ARC builds:

../drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c: In function 'navi10_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

../drivers/gpu/drm/amd/amdgpu/../powerplay/sienna_cichlid_ppt.c: In function 'sienna_cichlid_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

Fixes: 55084d7f4022 ("drm/amd/powerplay: forbid to use pr_err/warn/info/debug")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
Another alternative is for amd/powerplay/ drivers not to use BUG()
or BUG_ON().
A third alternative is to ask the ARC developers to implement BUG()
without using any pr_() functions.

 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |    2 +-
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -52,7 +52,7 @@
  * They are more MGPU friendly.
  */
 #undef pr_err
-#undef pr_warn
+//#undef pr_warn
 #undef pr_info
 #undef pr_debug
 
--- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -54,7 +54,7 @@
  * They are more MGPU friendly.
  */
 #undef pr_err
-#undef pr_warn
+//#undef pr_warn
 #undef pr_info
 #undef pr_debug
 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
