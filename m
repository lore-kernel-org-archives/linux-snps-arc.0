Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9EC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3cL4CUZYvIFOdV0IZi2hCPdS7OKCODaYMlEOpxW6jI=; b=rQBcF1kTQHhrRr
	y0ED6EcTYXfMaD+FO+6X4MEN6a5T9Fx1gT0PvCfFXLm8u8gYygpweC8lmSlIckr1a8vMOU7tVQBkq
	k/QMkxGSCmQQC8F1igPhV3qaPmoLMxAO/1Yvw8ExTzD7FoZuiHbopkXMcqwQ3UwOcQ/ahaeu9ai9c
	18EkOeNp8crwI6RM8eA6mQkmMM/gKHEm/8oXC8B4i5paTBjco9olU0raSgtjx82mFAZ7OfBPpGuQP
	aKwO2abHAZVedl0uufAC3aGrCWYbML/02UsXgYPnRK00IBX6p0OJPSJu7e7NNFtl3mSiFC3kDyWA8
	k2t0q+hmSVrBioaFpMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuZP-00CUdz-1p; Tue, 01 Feb 2022 14:55:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuZM-00CUcL-Cr
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 14:55:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id o12so34367279lfg.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Feb 2022 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wbHfx89jouWHWfWZOFmOM4b/vdqSA346FdSEhABOKI=;
 b=FkvTvq1mDZukGDGNdiVRb1BvtsV+jq3oMQDZ+wrQz/EG5k4/9SKiQTwWZ7Qy7kdHts
 2kx475sTkcnUIk+hd7PX1NDjdSox34kXZLLN6aNUjGRt+29OrZaXCMMoF9nAoJIaKw80
 YOewKqhIHK/EuEOaIL1uNHKT6A+5hrLvcMPLSji4ccn3bvwpP8YOEItSrcRIeapTUr0U
 o46s0oKfUpUG9liDectxqFXCSpbGbbfx4TweuToeGBO64ipxamBynZx5n/jQkR1DNwdX
 Wi74IdnnNxNBZ7hK60JE3F4LySsrfuAq3dZc7+t2juaAL516divq6x8uc1mWU2vCVJa3
 bdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wbHfx89jouWHWfWZOFmOM4b/vdqSA346FdSEhABOKI=;
 b=pWFN6ZNUWdFnYtUf0ZAcgImG4+42Gu2njM2Q2ISnom8jJ9VKEL5lYl/qhGtxTJkUI0
 1yRhht5Wcme2mNOUaNQzU7Wg3SzCx8BcJ5cGe2XHsWCvDQcmU84y1GPrIEtOfY0xB8Nr
 0zRbELJunivHMKOaRUdz8NM1yeSOArW4c/nWeDAq3EzcRAsp/kNEnaMuvkb5eQ+oml5g
 04UW9ULCfOtT75JFVqDUOCGVGjZ5plwxnjwpu8r/MOxOlMoiO8oMYsrB7XCifcauOLjo
 4rdzHvCrm86f3f0EhvRocaYIthVc5Ib1BnQoYhaxaOInL60U94gDjeJs6t5WBDlU7Fv/
 584g==
X-Gm-Message-State: AOAM5316xHDqdowFQeKA/LyWw7Q+/PqERcSyiTeAWkovrbZ8ja7MQSGx
 JiaxIfLJiBt3lK/BMQJ1RTfM6/POmfk=
X-Google-Smtp-Source: ABdhPJwjuzSAIuki6sJhpv8gGBFhYyYfwR6VM7d/CvHn8rKrN7WSt+VvP8KnoXCagrqyY8RKCDB5bA==
X-Received: by 2002:a05:6512:2342:: with SMTP id
 p2mr19602636lfu.382.1643727342234; 
 Tue, 01 Feb 2022 06:55:42 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id w11sm2492814lfr.201.2022.02.01.06.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 06:55:41 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>, Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 1/3] arc: use BUILD_BUG for invalid sizes in
 get_user/put_user
Date: Tue,  1 Feb 2022 17:55:36 +0300
Message-Id: <20220201145538.111192-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220201145538.111192-1-geomatsi@gmail.com>
References: <20220201145538.111192-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_065544_470282_ACE22DF2 
X-CRM114-Status: GOOD (  10.81  )
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

Use BUILD_BUG for compile-time check of invalid sizes passed
to get_user/put_user functions.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/include/asm/uaccess.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 783bfdb3bfa3..9d1205bf90f1 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -62,6 +62,7 @@
 	case 2: __arc_get_user_one(*(k), u, "ldw", __ret); break;	\
 	case 4: __arc_get_user_one(*(k), u, "ld", __ret);  break;	\
 	case 8: __arc_get_user_one_64(*(k), u, __ret);     break;	\
+	default: BUILD_BUG();                                   \
 	}							\
 	__ret;							\
 })
@@ -123,6 +124,7 @@
 	case 2: __arc_put_user_one(*(k), u, "stw", __ret); break;	\
 	case 4: __arc_put_user_one(*(k), u, "st", __ret);  break;	\
 	case 8: __arc_put_user_one_64(*(k), u, __ret);     break;	\
+	default: BUILD_BUG();                                   \
 	}							\
 	__ret;							\
 })
-- 
2.35.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
