Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66021E77188
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBmfIXIGzbOL5dh4pWRvxN9X9Pz8Xr1U7Y99Jwoc+Cs=; b=0hz9aSdhQr4obo
	TlujC96G8gtWQtO+0OR5g2LjKPnUdcP4vVtGH4kaosykFULjhdef3UKXlESdBjb4oysfw4cWnIu2G
	aaopGjWItsHUs+w5LAg9rj92alr02zH/Dzberv3BXnV9eMpBzX9xs/M3ZT0NarKBZItJnJA/4XGyA
	wlvq+WxALQ9dvOwZTxJ0ZbAALMsp99fhxNRdUtw3poQQHiQEYdM07FZsVzJwSya62o0by0IbFQ/xw
	6Vh6HgIZyua5z4FmqN8srXdqkNpPj1SwpBgT7UJTW97v6uXppAZkLURCRw2MjzFQGOSoULuRnw0zI
	A6PEz3kuVm4PR4kcgNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nj-00000000cMy-0mxL;
	Thu, 19 Dec 2024 02:35:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Ng-00000000cLh-3LtB
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725ef0397aeso257522b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575715; x=1735180515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz5f2fkK5TyUEN5/ypHLYKDvnfLQ33CHwDb71kc+wK0=;
        b=kQv/tlY/PRwOEDiFS2FaWgqLG8Dw5IjO/KIWBq8NplGU/zcWijs7oU7IKMkS+23SQF
         ahvGCUeEwzmqMDL6KK8rGRmU84MAh1N3tEyWlB8rxvg6mh0pmpGlJnBE3QURzMkcAW1b
         NkSyPJbQBguMlKhA1394PRfOfLmZcFVIHWNX9WTWoI1/VY2RuBZu3tZhdZcp2gIk98qE
         21kZaUwWGG75eNZfGCpONweItmZ67RpHYy6wVKtMDzy17b/iKmEP5L1j2HRyecsq33cX
         eCPOnK+z/yIkON3HIjlw84cqPoLzngBK8QSkHI30vOGY4IYVFOGsytHYQxNRyZ3heurK
         AMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575715; x=1735180515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz5f2fkK5TyUEN5/ypHLYKDvnfLQ33CHwDb71kc+wK0=;
        b=JoDWIMvRW8VF4YLEx4pKGNaMrAC2noeHHmPcF9CT/Pj79dBMfGHWcqlGki5ey6l8/p
         DCRNWT0ILN/RwEPSCyW26PFyRV67g+mVfrPP0flLGdQT0MkGnRAb7D7o0unQD430jRZs
         7yjI+wZKUHPhsMnnqsap3dto7g/AHZ6DIaNPlr7LIrIMpac5SdDrTH1TtCSYXol3M5WF
         4dkl5Pyq5yMPNZ64UpW2YOWdTp04n6e2qo3VexIQ29MmsxiQUyZEzUjafzYf77/9N0oG
         Z7rMCKfFM9NH0yYFWpje+GpHaAnnTzI7qyUMKltGrAVq0WP0oMEXOTuyEgsIrVs+d6ao
         pj4g==
X-Forwarded-Encrypted: i=1; AJvYcCX1kUA4zyQmv+wvtxYTouJMvv7qwSZLl3/y1PYW0YTjRKjuk8mQ+ZfkxiK5F+ZWx3P+tUHghym3Kc9lfKnXsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCnOvNmu1qzLUOso6lCpXOTNLdQSWYYYNIhgghjs6SxU8VyQkF
	pw00X+5hZ1UuJM2mVW3stw/R2+cEWxx2cNCfuih2puX4q44HlFJE
X-Gm-Gg: ASbGncu2LcS2z+1xcb/3GrDHLkKJQN0k0AEJOk4DnPgrKSBPvmZj5wfHrZ5reZBe2pz
	J2NVACt+lOx9RRP42DPL8WtaerSjhuGyJmeESpzUEd/1L7rI5r8JKqjOXdwJ/JemgmpJFu7dMJa
	D/3jsgjiR6OArzbHo4/Ye2F1ppMJxh58eVaKlfu1tq3+tT5wFjXgNhWYgppPLRjtXMImkMIHg1L
	jevGvLdLkcLT7r7TkufJG6lnNj46iJI6yiuNGXsnt7JBo5TDsxPy/3iqb1TVnqJLbvhW2K7K7/T
	+s6usno=
X-Google-Smtp-Source: AGHT+IE+5BVERtvEj0uFGUNd3NBBPkGat0lwCNqupmyw0FAX2xvKE0cJmTowKcGod/Hmj9SrgliLyA==
X-Received: by 2002:a05:6a20:a11f:b0:1e0:c0fa:e088 with SMTP id adf61e73a8af0-1e5b4810ff0mr7532504637.18.1734575715510;
        Wed, 18 Dec 2024 18:35:15 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:15 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org,
	pmladek@suse.com,
	kvalo@kernel.org,
	bp@alien8.de,
	andriy.shevchenko@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	ocfs2-devel@lists.linux.dev,
	Yafang Shao <laoar.shao@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH v2 3/5] net: Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:50 +0800
Message-Id: <20241219023452.69907-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183516_846596_FE46CE05 
X-CRM114-Status: UNSURE (   8.18  )
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
---
 net/wireless/wext-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/wireless/wext-core.c b/net/wireless/wext-core.c
index 3bb04b05c5ce..bea70eb6f034 100644
--- a/net/wireless/wext-core.c
+++ b/net/wireless/wext-core.c
@@ -640,10 +640,8 @@ EXPORT_SYMBOL(wireless_send_event);
 #ifdef CONFIG_CFG80211_WEXT
 static void wireless_warn_cfg80211_wext(void)
 {
-	char name[sizeof(current->comm)];
-
 	pr_warn_once("warning: `%s' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
-		     get_task_comm(name, current));
+		     current->comm);
 }
 #endif
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
