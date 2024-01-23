Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79780C46CD2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Jan 2024 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTraeBdvfologFI3yBTeaRXt4RPz1Mto0xsVNHoCW1I=; b=drgmLvTUkl45VA
	Cc5FlcuzHNURZFgLbLijKVgxCMcVQtQjgFXcZ8q5j3L7um4fVvwt/eBYPdCwtF6p+EMD4fI9dDzP0
	MUwIYwtSfhMyT/QjeiAa0a/WLxkJTwtzQ/WG8+y255Z+m8XxQpCRrqrt0sVmFXKwfK2hMgyKGfAB/
	vsJJKoVAyeDtFB1mIP3bRyC08vG8WGVY0MbJuqYkjzLykMVsAU52OtmMxT9ZQvpVA+jtw0+sg0mJl
	VSbTKALw3jyvY+/pmZh2DhpVJ/nYVJvWRyz+Y4udW/QeNg3JT9Py4znPi73ss4syFEC3HtFiv9nT1
	yBLxk3LscViABFF0LtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS4lu-00Ec9K-1b;
	Tue, 23 Jan 2024 00:36:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS4lr-00Ec6n-1q
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 Jan 2024 00:36:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6db599d5cb8so2838873b3a.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 Jan 2024 16:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705970164; x=1706574964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR81ltEJY1+adfuk1StzztmzyEgwb5jSI4QB5TV+ifU=;
        b=ZcZDBrCf4TLRwu0aYpVJ4MsolPifrc1i6vEUzExHAXfg2w/6e0nMJMFUTCgLc66ho6
         yzcXRFoIOeYIACSBofNqUiw99kme2l3TVIzCZnyyXZXiJFRABdJuYp9y1y+RW6RhPyag
         awO66Vg95zQ4ubDYhun3fAUISyD+MPsmA8DXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705970164; x=1706574964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR81ltEJY1+adfuk1StzztmzyEgwb5jSI4QB5TV+ifU=;
        b=F3WF4JATeNTrY7axP0gazOyyrV6+sDF508rDXg1IW3T3LiOuZsBo47UfwWo135Xv4c
         PGqUCzzWyBcxG8ZtA7J5tqVpdOQWodrl4UNnI8x2u/8Oxr6TuqZJru2nNsQZL7ju1n4V
         4jqzALcxnsoLITh+MN+/u715ggWMxPsbFGSiG+3j0yxZzooD7rfhJ/DRMD8192RtrR9J
         YZ4XzhiqNe3HF1El1y5WeOFMmVKEeTQEAv9SzsPayzZ+H60tafKbXhI0jqIfsYLPUWdK
         QQE6q/l8Z6qFI30PkScD8H57PY1Lxxu3piDtBFtwurYPTjUmnyRhN6t3lqxqN8gjIr0W
         VOww==
X-Gm-Message-State: AOJu0YwzuV/w4MweHiolsMIbjJLKX37wvUJO9ilTR+H9ydbtuqmOlURb
	w9Jbt+m/dZlpnl9FSQ04y/eLnTe5VPoE5mFGoj7fOYI7Aj1OiP/m1IoyBn8hTw==
X-Google-Smtp-Source: AGHT+IETzqCGXqh477w/Vt9X12Qb1US/a7Y7KVrRlOIsy+HxOGDJxNfQvSuTk1cc7EBIelGSQhNLMA==
X-Received: by 2002:a05:6a00:3d08:b0:6db:d3ae:c000 with SMTP id lo8-20020a056a003d0800b006dbd3aec000mr2323879pfb.58.1705970164470;
        Mon, 22 Jan 2024 16:36:04 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa20-20020a056a002d1400b006dbdfb7624bsm2604635pfb.170.2024.01.22.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 16:35:59 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Song Liu <song@kernel.org>,
	Yihao Han <hanyihao@vivo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"dean.yang_cp" <yangdianqing@yulong.com>,
	Jinchao Wang <wjc@cdjrlc.com>,
	linux-snps-arc@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/82] ARC: dw2 unwind: Refactor intentional wrap-around calculation
Date: Mon, 22 Jan 2024 16:27:06 -0800
Message-Id: <20240123002814.1396804-31-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495; i=keescook@chromium.org;
 h=from:subject; bh=MKnCIiYxMUg6EMcU4GoE7nb0L53EnELIMYzEtk5B3VI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgHizE4jMkQP4lVaRSlAN3nsXgRBmjv5Yv2Y
 jUxJ6mHsSKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8IBwAKCRCJcvTf3G3A
 JmQYD/98DgXrMI+bVIn8YEHNHDNyYFr5nzpnwmbjD3Sz8E9MWTiYwicpEwQnGO0Q/EEzKTOvBS1
 4Hrkrn3ocbughedFtxfFOlwivI79gd1rpJeBTQfjE6Py7r2/Y+5ESY7vktL0eRN9NBt4TvZl4Ja
 BJEGqffrG4McZdVzS59Cs0V6bCR+ihTOANdUe5VnZxVI3T/yT2UMfU7oWks2nWbulsUBccyMyaA
 cTvuGVwjKhkOZ9GLFj4CSu8RRzdKqCIeV4Eo9xnX02e7J77HX6UA8x3vLGyiWkvjOc7su6kypgd
 HOXyYTssc0iCHLUP8pVZE7n0YY6/clIuUL3Zu9934A8kkqPAaGkWp8JOWXZq1DnWiMrf8Ko6g8A
 w/SqcWooHJjVJiCWn2yrzhLzOYrCvBZ1266Y5Gi4uXt0nnNU4tPTM6HGXBhBzzKuIzRFEuxvwpK
 lzDMBUArU4Wc5iU8hESGejpfFvph+s6wkXFTOr9m0Zmt/3V50IO7OIv4z3iQyKjPExWQN+8ziw7
 xu2jcMJPbiHfLSLeLG7nr8rS6FFeYHwxbtX+hVwlYoY8+FWuoHvVgBtffkKaVAs7jrO4Qc9zOrz
 tLMrL5nM0Nox/WHEyYVc0R9XtIdpSXrz8wODRMyNbYJWdGbjPCsBw7iksSGfPcmy58Ox3u8RP0h BsHK0ekMlxhrX9g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_163607_608239_5B5079C0 
X-CRM114-Status: GOOD (  15.57  )
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

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded pointer wrap-around addition test to use
check_add_overflow(), retaining the result for later usage (which
removes the redundant open-coded addition). This paves the way to enabling
the unsigned wrap-around sanitizer[2] in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Song Liu <song@kernel.org>
Cc: Yihao Han <hanyihao@vivo.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "dean.yang_cp" <yangdianqing@yulong.com>
Cc: Jinchao Wang <wjc@cdjrlc.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arc/kernel/unwind.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 9270d0a713c3..8924fa2a8f29 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -612,6 +612,7 @@ static signed fde_pointer_type(const u32 *cie)
 		const char *aug;
 		const u8 *end = (const u8 *)(cie + 1) + *cie;
 		uleb128_t len;
+		const u8 *sum;
 
 		/* check if augmentation size is first (and thus present) */
 		if (*ptr != 'z')
@@ -630,10 +631,10 @@ static signed fde_pointer_type(const u32 *cie)
 		version <= 1 ? (void) ++ptr : (void)get_uleb128(&ptr, end);
 		len = get_uleb128(&ptr, end);	/* augmentation length */
 
-		if (ptr + len < ptr || ptr + len > end)
+		if (check_add_overflow(ptr, len, &sum) || sum > end)
 			return -1;
 
-		end = ptr + len;
+		end = sum;
 		while (*++aug) {
 			if (ptr >= end)
 				return -1;
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
