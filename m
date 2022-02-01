Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB912C433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZcsSmoKt1onYDsahSfapShcRXgMj4ZiP1hRVg9OS1Q=; b=Hq5NFQh8Sh7TYF
	3zNlBHtcQAeaA7UkR29fYpl0VOLjtM8fd4bLwHXSOZIvUYa62XPfegyhMWOU8MLvJExgmt1p1/E6D
	s5pWyMg+uuxSAg0/LvaGmmVRCdWx8VBwqt4pXrPTkjrV/QqMXmTS+1gMXEjaSrSMMU0PmJALDe7Dy
	wqTa1UCmb9UXNi5dx/6E6hpIp2uR9eZ3le6AYSUvUmYWKZ7IDkmWpm/PEv1/AdjZzHoukvUqlNWdE
	qFOJEyyiwynRll/8YU7qsWoVgNC2PpUTbaLesN8iCuzsw1g1+0acUzho61h83Mm8dxCGuVd4smFTc
	QX0J3CXxrpg4tu+BgsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuZQ-00CUeS-6w; Tue, 01 Feb 2022 14:55:48 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuZN-00CUcT-Ad
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 14:55:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id n8so34413176lfq.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Feb 2022 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNMRDeIpE+Q8XxSaSff1ozyOTBrSOOJ32w/junrpUcY=;
 b=IvdjGXW7PT9822qmdXIQKHcLrLqkIqCUSh1QeC8/yieY/4z8unJ2ycKmn0HZC77WVV
 EVx8FdnMVoUPs28/7rNKzp37VPLtpAyNn44Yj/3c9oqIvzdmX9VOBK2QAcCDZk660zeI
 dkxfu1MvEhy/sHTHgQ15wEjrakjOfH3FGTx0g96p7FRg3GojvSzy2/uNLMbQMMmqBW/8
 ZlEc1nJziWyF//EB8unywCEsGwX7XRk19GAbbxDH3ye2uagOXmsELu4anETHAnWVuCbf
 Vy4m6Ovd8ljsymNA1kcsMLBp4bJkq7V89gpBHfTG9fevJ6nNp+HxnVyFO+3HYgT3ua4y
 AsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNMRDeIpE+Q8XxSaSff1ozyOTBrSOOJ32w/junrpUcY=;
 b=e/tyUkXPJ7sF3rPqial0QGQM0JEJX62Hgzj1VnXRUQ70OifJ6sZi3ELcuTGKAWwSPo
 xrVSwNQ3GimHdw4rlg7NJTqNVDuuU8xdMEODNbZrmJQHtAEINY9UttE4Ws3kFYs5PicP
 Ysb78vw3VRuQRudq+iz+FSyugJqm9+4J03iu2GSEACBRLbUvNag8r+KcyikA/wlOk9MI
 N3ukxhhi+yAxAlfbFCABu8CUTCnj3v60+Id9u9bUyy62FW+fOJoum4uKHckC8evgc8p9
 dEuOBi+W8LTgPn1Vfy3THdiuL8GZeb4jLAkxuM+Cv5FB3+OW/w4rSRJZv/6LHA3E0mM2
 fypg==
X-Gm-Message-State: AOAM532EnLPO1ToK9dWLBPW3muCpW+d5OLrvfJDtO+QbXfIm7L8nptfC
 vk/T0XLlXwoRa2SoaiKVhuVciX2xmD0=
X-Google-Smtp-Source: ABdhPJzUDnN2Fbo3LctDhYGjUFAdX4wxC30dpxBXW0nCxzf/GSsMf6MTl1B+CYgD01TU/B3AQI/URA==
X-Received: by 2002:a05:6512:220e:: with SMTP id
 h14mr19113079lfu.212.1643727343210; 
 Tue, 01 Feb 2022 06:55:43 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id w11sm2492814lfr.201.2022.02.01.06.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 06:55:42 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>, Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 2/3] arc: provide __{get,put}_kernel_nofault
Date: Tue,  1 Feb 2022 17:55:37 +0300
Message-Id: <20220201145538.111192-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220201145538.111192-1-geomatsi@gmail.com>
References: <20220201145538.111192-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_065545_413330_A958862B 
X-CRM114-Status: GOOD (  10.93  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Implement the non-faulting kernel access helpers directly
instead of using uaccess routines under set_fs(KERNEL_DS).

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/include/asm/uaccess.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 9d1205bf90f1..c14b692a0a4e 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -657,6 +657,28 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
 	return res;
 }
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+	do {								\
+		long __err;						\
+									\
+		__err = __get_user_fn(sizeof(type), (type *)(src),	\
+				      (type *)(dst));			\
+		if (unlikely(__err))					\
+			goto err_label;					\
+	} while (0)
+
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+	do {								\
+		long __err;						\
+									\
+		__err = __put_user_fn(sizeof(type), (type *)(dst),	\
+				      (type *)(src));			\
+		if (unlikely(__err))					\
+			goto err_label;					\
+	} while (0)
+
 #ifndef CONFIG_CC_OPTIMIZE_FOR_SIZE
 
 #define INLINE_COPY_TO_USER
-- 
2.35.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
