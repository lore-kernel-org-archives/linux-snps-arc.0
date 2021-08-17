Return-Path: <SRS0=8txo=NI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E766C432BE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 00:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BCC26054E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 00:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BCC26054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4rnSCuGXHpmAtoqS6/oF4nV6Xmp/an+PZT0XPAf4p2A=; b=y4EKFB8E0UIT3t/ebJ4EU5J1On
	gz3fA6tXCa4xM7O5cWwcuBgf3mjyzPf1TUQLF1OYwN7GJn/hkmNlzkfOKn49+DNNEwhiTrus3qzNZ
	03y3ermG0W5lsGQGtjikrMmrYw8yMMk6sKAQkSfCr+W9MU5PZSOv9Aa/HozeTjkX8ZqFwinYxeLaq
	Fit1KZuTPj0RfIYzd/HF75kEtxOaISz3b1INH4dkqikvv8Hkya4aDUiUPJvXuPw71DrBuuvbry8pl
	OPRV3sPM848slxLy3zMhaDdCmfUqVLyJFTwsCnpZXVlMtmJjFJWic5mdA7WTvcDEyriDAlAJ5cSec
	me5Sq90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFmrD-000Zkv-2x; Tue, 17 Aug 2021 00:21:31 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFmrA-000ZkR-7t
 for linux-snps-arc@lists.infradead.org; Tue, 17 Aug 2021 00:21:29 +0000
Received: by mail-qt1-x849.google.com with SMTP id
 o22-20020ac872d60000b029029817302575so4039632qtp.10
 for <linux-snps-arc@lists.infradead.org>; Mon, 16 Aug 2021 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GoHRqY6WMaY6q/Xzrr4/n035GxGMZNNS93sY1WbcrOg=;
 b=TRXaJLDpWOVuB4lUnlR+yoS05hBwCJTWDCzu/pBp8cTnnT6F7Cj+KPqeJzpyjiuk9r
 D0TRbzxeB9Zm7bNFH9MsLf12RvSLW+1UOYiut9GL2AKqK2fXU7eS/y/1UG1PQ5o6FsBq
 nnDHDHobEWdCpHsYkT8jH8fhkzfbLxq3aL44Xvr9jF2ld0ZNagA7V0vv+QZ3qIfPjwrT
 qt7rhl74MpeqnLmGLafLTXAix2cNJWfEkg0DYO40xeQsuYCvcoj+Bk7IgkVdocaIUUej
 mMAI+Lt6hiJoGKph+Upxe2H1liP+TIPFQO6VnTiVprHWHg0ozuE/6Ztn3NQ5P6hvgtYS
 US2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GoHRqY6WMaY6q/Xzrr4/n035GxGMZNNS93sY1WbcrOg=;
 b=gIk8bQQoKwZvuwBcq7ISgRm7wnqH5nbsEj8a8+nHTueYnoaxy4gt3g5EzCJCXPfKQD
 8mZ7DetURpOCpSeTIRYqTIXxTQV4eCBZfgvk2MHsT3XuBVVzVmeD9GYgJzDbal5f0rfK
 XnOvLykggJzGW8Y6PWwZAnKhGV+Cu5HOR1mO9/P5iE5HlQkfbRceok5OKF3ELRxtcIj8
 U0NEap7mo/3pBvvlVlvRWs7Jl4kbLauWeFuWDlocTIQ8H3Dz9jD2HDmAXWxT+dP9Mcsf
 CGCOF31Bm6uM/6KDEgro9MHHV8aHZZj3AON9Z9BN2NfeQtB9lHY+EFACn2rvLKrsosuN
 VGRA==
X-Gm-Message-State: AOAM532s1anDOOjgAFl8Ph00XswDNgTk5ls2K97YyH1cYLmNPZCAsWuX
 CXX8k3UxWXphle9ftrZJwOZ6qQ90vXBWSE5DGQQ=
X-Google-Smtp-Source: ABdhPJzQ7I5BJ/a8ZE26weFpk5AiUI/hLKNy4VKXu2vcVT32Uc9/c1Tf1DTt8IkYNyTPOt5ZrpKMfHQkkk9cIfkMEUQ=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:410e:: with SMTP id
 kc14mr705288qvb.33.1629159686159; Mon, 16 Aug 2021 17:21:26 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:21:06 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, 
 Nick Desaulniers <ndesaulniers@google.com>, Vineet Gupta <vgupta@kernel.org>, 
 linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_172128_329069_4941C411 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arc/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c0d87ac2e221..8782a03f24a8 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
 cflags-y				+= $(tune-mcpu-def-y)
 else
 tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
-tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
-ifeq ($(tune-mcpu-ok),y)
+ifneq ($(call cc-option,$(tune-mcpu)),)
 cflags-y				+= $(tune-mcpu)
 else
 # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
-- 
2.33.0.rc1.237.g0d66db33f3-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
