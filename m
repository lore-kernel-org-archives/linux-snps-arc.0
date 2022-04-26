Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C608BC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Apr 2022 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j13aoyuwX62BOpvzlvA+yzkfocgleifV2GYrU6zEsH8=; b=Sa7muhNSw8CSEp
	LCDZq5j9bN4yUGAgCS5xC9m4l1CbmdQGvWVJc1LTwXDIILJR/6KBruIBIqvNKExlc6SkGYYr36r+D
	pmfHfR24DK8b00G1YbOxdj2bZbNCWeCPkLlSyrda0iRV9bJWO0mtvp+NIMwmkFk0delQO+XiShmPI
	vY4ew5tTWe49DWSBLn5L4o01mUka0VZSiwIX/rNyyzHPs5dEOvMoHE68ALsg9wA7zQBDiBJyNfdrJ
	NKHn9zRYyYqzuCZeId52Sr1gqE65VddNK/kOOiUYOLjAm0t66k9hAw+y/szHBBA1NXuE/Ld4z9pnT
	Qq17xQxfGo/2KK4j0adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFZF-00CwtV-4p; Tue, 26 Apr 2022 07:25:01 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFZ8-00CwpQ-IK
 for linux-snps-arc@lists.infradead.org; Tue, 26 Apr 2022 07:24:57 +0000
Received: by mail-lj1-x233.google.com with SMTP id bn33so20763482ljb.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 26 Apr 2022 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QatKDqIJXTd0ha8rT4aoWCPOv1oQrsB7sGUjw0+r3Do=;
 b=D5Cj5aWOPbFuH6sEFl0CDSYpU32ok36kuR9I7nmoEo8+P8aN3TxeHGY5heqLFz0Dzf
 ch2bTlEbTGTgpx+xcKPPWUf/JVF+ZLW4ociACmDf4Hcqv/Go15zMBAqQNDGoMsh3ltKm
 hKjspN7F3SzK6GLuXJJzl354ZS3PzBsmOzWgzEyQU4cX6A0QY4KiBV/ZH5h6UWcrnYKQ
 tMB98okr2Ep0rnOVGJyAfc4SIe3PKqvLlYW/4EQLRMAkIIwR2QcBgPGHxPKrP67nU9FA
 0Ig0eVb10FVtb/6X9IeVPEBmTN6B7gfo2d458M3vnIiRzA+U+8o9IlEjq5Ij4jr1Leb2
 sHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QatKDqIJXTd0ha8rT4aoWCPOv1oQrsB7sGUjw0+r3Do=;
 b=eC1gg+giod/wgH2v0I0jrca+WpS+mqnlYpkTHQVznbQh34KvzteVL+XbF8kYhPry2R
 ZwxlSByEo2xvlwIYRzO7tMRf1hMRmuq7VPMessC2BS/sf+er+E9YZI1sFJPZh3+xTdWH
 jS7uOCHHQTkBqREs3asCo3QzeEuqqb+LNeaimIoK7t4EVGVdGUmGaj7quQc5vfY8cRPn
 9PtQ6LN5CzFcBQzHXQTQxoSX/QYIcrpRUHkxApDlzvYT1vIduy1UKNrCosM9BBgrn7l6
 V20KEajESc7qnASzAHH39u4Dz3e0KNRYZaBAmKgNg6T8VQTNkWdB46epBupXx9bMbTp2
 JWig==
X-Gm-Message-State: AOAM533/ypL3ZgL/xshxR6+Ov7WvafKGl/xOcEFBO0YPsQ+XNfowuuJw
 ZQ9B5P5cfax2YCoO4KaYZ9ETMy66pz9NyA==
X-Google-Smtp-Source: ABdhPJw/unw/mJA7rEQPSuf7oh70tHqH8N/jRWpeEIQzgFk+kViiIH2Y/JlMovZ0BKy9B76HaTfnWQ==
X-Received: by 2002:a2e:b895:0:b0:24e:f423:93d8 with SMTP id
 r21-20020a2eb895000000b0024ef42393d8mr12019359ljp.288.1650957890146; 
 Tue, 26 Apr 2022 00:24:50 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e94c9000000b0024b4c2a1346sm1439964ljh.123.2022.04.26.00.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 00:24:49 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH/next] ARC: disasm: fix gp name for arc700
Date: Tue, 26 Apr 2022 10:24:47 +0300
Message-Id: <20220426072447.125975-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_002454_701894_0BA5E7BE 
X-CRM114-Status: GOOD (  10.50  )
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

Fixes: b08a66fb680018b6 ("ARC: disasm: handle ARCv2 case in kprobe
get/set functions").

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>

---
 arch/arc/kernel/disasm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index 42a9e48698b0..ccc7e8c39eb3 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -491,7 +491,7 @@ void __kprobes set_reg(int reg, long val, struct pt_regs *regs,
 		}
 		break;
 	case 26:
-		regs->gp = val;
+		regs->r26 = val;
 		break;
 	case 27:
 		regs->fp = val;
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
