Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36188C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gu9oadYdgqefMNH3C7wZlqwEr894yMbuBX+BAAm3GuU=; b=Xx9+jDn6digbJs
	uIgx1oTx9LdYYOpk87hIahzMqseHDVFN2eq71b4NuIgAKkrh5TOybAm6lswuxzrqzfEXCe3wgRfsn
	+J1OmgG8zwtC8IwG9XIVP/itmGmgnDdpgMgJg5xQzzUCNKkp94id44QurDC2b+Tdt9uSNN/JeCgXn
	jMPyW9MLDeAO7mtH2HT4sqQwjTTnI/r1P5pvakHzAHmrXICqQK+K9+0i6zFOxWYbFXcawEjrH/z9/
	NmlUKpt9YPwp5sF59n+/fcyq7xkl85e5ce1MOIv73wVq1XJUhO+Oxwi0sqQJCXmjbaX+BVfcX0nke
	mJS9Mkpb0FSJgqLfLTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuZO-00CUds-T6; Tue, 01 Feb 2022 14:55:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuZM-00CUc6-2p
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 14:55:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x23so34551031lfc.0
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Feb 2022 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hww9yyJ2bkpQkkMUiZgJ6NB9McaQWv6oPk3ulczPaM=;
 b=K8DA7XyLG7K2+K+USPOYFcAb+XMTJ/uvYuawrLonM5myur+C+j8T/Sco0zFmZReSUf
 xdaZUFxv5EMDyBS1Jv2YE8pTG/cMXFMHWNJQ5bM5bGFxtgL9i2NPfZIl75LBHyVI4lFX
 KrGbi7eIKIWzh/Cgx7Gj2mG+j6gwgnNXyqoVUojdqB5aKp9un/GTb52iNVSMSKfK2aKC
 oi6EFrWRVe5g0fJ3zgYVV4erKjD//wUToVkyTIrxA+5UjDuMLKK20xN/l330QUFS9iN/
 4K1NokbgHBJAwp66gOSRTB8SHWN5PP+7gtX2JsSFB9l5iuHFqp/DGfbeZtfIIbvRiPSO
 16PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hww9yyJ2bkpQkkMUiZgJ6NB9McaQWv6oPk3ulczPaM=;
 b=3TQqtscgINUHKerNObWuKzmytobbSrNX2NFrYWZWZxJuvmL0rFIued9RNarTV8mk2V
 Vzlr0e5+kUdtHcK+4qCVvP67niHxRnVK6bqQOtfGryYQOBrsCukHkREE7zsqTdmS+PFv
 AWyFgiHOnADF7lFdbwi+ylQgWcFiB0gPuRAc4dgU4eQpGuIupVBSoJjZwXnbVTb3wak4
 6NBXRrR+kM6ZODp5FpHhKm09Wnb8MVJZMO2fRookiNi22Nk1zr4Ep8yVu3QOexhsB390
 iOF0zI21ZnHkRW91tyKxt8b7hrLJyb7O4oATpsNWpr9r9jXUYWvSIowwhbfAeD7/H02K
 a1LQ==
X-Gm-Message-State: AOAM531+iGy239GOaib1/yHsKTcO+GPoWpwLYII3pWPpKbUQD0LnGyTz
 hgOH7yVi9bkC2uL0oGxHc/fyhSj2P1A=
X-Google-Smtp-Source: ABdhPJwdlfZtGMAvfDRlrQLg19fC7MN0iU3qOjJkzDoiyWz7pKnCW9gN8Ulq1tM8yR6bS5O9hu1kkA==
X-Received: by 2002:a05:6512:70a:: with SMTP id
 b10mr19469375lfs.672.1643727341202; 
 Tue, 01 Feb 2022 06:55:41 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id w11sm2492814lfr.201.2022.02.01.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 06:55:40 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>, Sergey Matyukevich <geomatsi@gmail.com>
Subject: [RFC PATCH 0/3] arc: remove CONFIG_SET_FS
Date: Tue,  1 Feb 2022 17:55:35 +0300
Message-Id: <20220201145538.111192-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_065544_142153_39A08945 
X-CRM114-Status: GOOD (  10.03  )
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

Hi all,

This patch series removes SET_FS support for arc.

Sergey Matyukevich (3):
  arc: use BUILD_BUG for invalid sizes in get_user/put_user
  arc: provide __{get,put}_kernel_nofault
  arc: remove set_fs()

 arch/arc/Kconfig                   |  1 -
 arch/arc/include/asm/segment.h     | 20 -------------
 arch/arc/include/asm/thread_info.h |  3 --
 arch/arc/include/asm/uaccess.h     | 48 ++++++++++++++++++++----------
 4 files changed, 32 insertions(+), 40 deletions(-)
 delete mode 100644 arch/arc/include/asm/segment.h

-- 
2.35.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
