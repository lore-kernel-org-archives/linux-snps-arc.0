Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C47C001DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Aug 2023 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EDFCCKj/PkiGPP5Mp37uJ9eHXvlSXUFi/nF1XFku87Y=; b=qjy/M7HFQPSvev
	76FRt9s5C10nk7sBQgFJGTL+jOnGn8fdCJl34/X+o8IIIPvDX4FYBptE7NyAxSKBcEoE82S2eC0k5
	Pcg/oB3RqdVVEYIXHwEASsjS+PTqaWkP78eNFCMdVTuFOKLAaB+to//R59g/QQmRfW9gWPT+1zMzw
	+XEvzgQQP0jDdvyva2isTx3slypeIY0E+w6IohJHKswpTOTZALxySGyJOgQUtBha+YfAqIr/YwENj
	XpAcUKGiSJA0J4I4T1fzSEiiD6c5Np0ZZWv+RbRO2oq8NBScmUkVjsZcbL8N9qhD1OzgakjpxGt5e
	VS0ovoy/Xvo3V9T2y0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2k-0020a5-0Q;
	Tue, 08 Aug 2023 08:26:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2g-0020Xy-2g
	for linux-snps-arc@lists.infradead.org;
	Tue, 08 Aug 2023 08:26:16 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe48a2801bso8837148e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 08 Aug 2023 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691483162; x=1692087962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKaXpSlwUGOFKYnA0/ujGgP0b2CVx1lfhbc608RRtk4=;
        b=rnz+0XPRB2sHtMy6nbW8pZ9GjDYrGLEbNQoEVJAihnnljaMNBtDusEI345r287ae30
         ZM2Cn81F4Ta6au3gUvUFq6q4tc9EXGK9jffv4ItxVRLItuPrx92LVpOEnB9shG7CSR1d
         HmSR0/cSw1Ed2HeD59yLI2SMMjIJyr1DqUFi33HtJ95izeJAwGTUQUIS4PMpQeCMVqAc
         gMS+FU/AG6MvCWH449A/0pFfOpcNvO0b0eSzNiUva4bVhVYxwTB60mSCJEkD14mXUxyS
         gdp5aDzpu99SRjlqcHOAkQt4QEt328+Vut50ZbrN/MRqdti86EfoF7qcv5/H+A4Jg0X5
         5QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691483162; x=1692087962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKaXpSlwUGOFKYnA0/ujGgP0b2CVx1lfhbc608RRtk4=;
        b=FNql9nghcxzBouVvhRfSd3eS7Oie1CFGkVGSg5Rydz9zA7tkPbZ6FSIbPwDgss/A7L
         U/L6HmiTpKhUG2nUwsqwHieA4rZ8Lji7yAlhlMUp6vWgo31LSyjfrwqZiViDF5FugKp2
         qKZ3gnBuTIuvJBmRVxXzhy7IOQ7qK3cfhByZh4v/s1kqg4LxsTfTNHXhrCsiWk9dI8a2
         PXKRCq+tOTHewjDQG/uyaB0FtTiNMEJ9XFnVuKFXRLkWBt+a/GczRW5dm3SzsnFHvDxF
         L2ST9Mu8TXF1AsYVp/d5SWkdViVurJ9YH/v2ZtcVIUF8BCIOn5MiN85FJNg06Ollm+Is
         cvMw==
X-Gm-Message-State: AOJu0YxDLEzk6u73o39gK1SVUsSU/uR4HKzQueeToofu2z9P+vwpHjfE
	QvTtoZjGmgpiGAED1yz0SM7sbFAiK7Vj11RH5xg=
X-Google-Smtp-Source: AGHT+IGwuIaXMoIESGfMjXZqvgjAKYGfq+7lPk9/u4u6+4RfcqSnKW8XNmPB5gwM67RaOJssLaTogw==
X-Received: by 2002:ac2:5b89:0:b0:4fb:7888:7e6d with SMTP id o9-20020ac25b89000000b004fb78887e6dmr7043859lfn.46.1691483162463;
        Tue, 08 Aug 2023 01:26:02 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004fbae18984dsm1787087lfc.255.2023.08.08.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:26:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] csky: Convert memory accessors to static inlines
Date: Tue, 08 Aug 2023 10:25:54 +0200
Message-Id: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABL80WQC/x3MPQqAMAxA4atIZgP9GaxeRRykphoElaYUpXh3i
 +M3vFdAKDIJDE2BSJmFz6NCtw34bT5WQl6qwShjlVMOvewPZo4J04nX9gjaxSmvO6N16KF2V6T
 A9/8cp/f9ALLAmCNjAAAA
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_012614_889596_0220A2B7 
X-CRM114-Status: UNSURE (   6.29  )
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

This converts the virt_to_pfn and pfn_to_virt macros
into static inlines so we get proper type checking on
the pointers passed in.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      csky: Cast argument to virt_to_pfn() to (void *)
      csky: Make pfn accessors static inlines

 arch/arc/include/asm/page.h  |  2 +-
 arch/csky/include/asm/page.h | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-csky-virt-to-phys-3d80c17211f9

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
