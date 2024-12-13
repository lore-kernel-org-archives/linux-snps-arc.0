Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD8E7717D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmREcS5PrN24hlaIydbvyPcVeEFLEEwqyAnpHQh463A=; b=S31dI7wl/Qgihk
	7VH5cfVgxSGgG9HjkJZ96n6gPgzTmpWHft/H+Sb55T1skMXFWzRr9BncZ8GUcDCSvrar3VzBJ2ERy
	cPGv/yG22+qKORC1zBKhayAt3CpKCvk90McC5ef3bJJWsRp0HUmKOW2cQsQ2d7caYhDGXOTGDO7bX
	RcKa5ytDoIrZUU3jD25Hxb79je16dQq7hJYMaw5LCT/nrWmz6/5EK3aN0EB6tpUBxjhhBc3j+Pi9g
	V6j5Mn9Y6bPqvKYetLFoAQKhsIGa+bF0zo4AXomGHQFSrxh16ZmSYDW4iZ46Epbdw8LfQj95Q78gf
	Z+cXwatJ4cNi4kTESMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLzfG-00000002ulO-0FZA;
	Fri, 13 Dec 2024 07:00:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyWA-00000002neV-109g
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:47:15 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-72909c459c4so378105b3a.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068833; x=1734673633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gS7oaK0RsPIguog+zKCBYVnzq+DdL6weynD0punt/E0=;
        b=iucC+PKkODoThFIJ9hWKPElIBc6IGtuBO12BQF9SnaiH7660xAuMEDD1ObYIfYyWag
         5aXlN2XhuXGJbktDOUTnv4jbM1RrBLwGl1kJJtD5Yal8EDO/JXDTi08iI0i+jHh+F86j
         Jt+FCBuCdzc151H/KWpc5eQdi4nXu8XhNgRoPdsu1UWvwDPHpz3CYCiIn3ubQ2nv3NGb
         D6zYf0Xb6NGEFJc6etHYVvtzs8pAl0sNPFIEMpCgYYgFq8aWb5QQZ57EuY8O/iZba8i+
         8THiGF3+x/WERf8iX4Y9wkayotW6fLhUhIdLun1w1x47N5UKyIViPbGtMfTAZRP1cnyk
         Mdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068833; x=1734673633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS7oaK0RsPIguog+zKCBYVnzq+DdL6weynD0punt/E0=;
        b=lOs82jUcNWrCOUzespXiBTZ62X7wKxT1rVlmsej6O6SYwJZ+hB1o++NwLyj6ULp+Tz
         S1E+aRhAX0t1euNfaYJxmaz9/H0AhRa2Ekv7h6uWBQL0OU5dATEmDI+0SY2Y0BtiA7rc
         Ghn1oFkUJjj1ZuAGcW/IU350fNQeZbeE09X8xmavVkzZkaQ9xGRDT2i/4shG00Q9pXXt
         hgJQGfwmJZDSVEaB6Zl0MFLiBc2JameacxBXcShF4Fn6l0ubE6GWzQBwRtCFYjqxB+Ro
         C51s9j9rVzHPTxyEkBR92UDPHqA7WZTejxm9NbePiXw6GS3ESyTHPJrSXFWFM2sg+tf3
         gZow==
X-Forwarded-Encrypted: i=1; AJvYcCWQvDzGL3rDHfAt9O6w1HooWUKGj3hoOabk01oRrFNhSGfSITKfuvS77veK9fEI14AVNTywisOdpZsSxtT2xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4FEfT2BqZIL7aK2cLT4B3VL7ebEHDENo/pTNRsHc5R9NFFFIl
	qWsXI6CTzhKKD0DIj3f2QFjerZoC51cUELks9XTWYKWUnXXXKgp0
X-Gm-Gg: ASbGncvjP4ZgGXrdTmOevJvTFC1dmwO3WMuR9BJnQ0fauKNUEBR3ZP6FEWpn0wRhxBZ
	1xIhubXnLOuQKvj97GXwQ43PiuebD2j2XuKcI4aLmLOlzNucsnl9KSgYSgdCofvJ4h/yv10BG7G
	9YkJN7ZAbmHia7xcELsMfPzB3J+X7lRk1XCEg1LTPWyMUoyDvitUg/CiX3xcdDybpmYfhRwoKkY
	HhVR5mpM2DKbDoJuUEyupa1RaYcwHaGEMU739LKU6ZpeGr2bv+46JUAe/Gr45L5+GtvqgvQQJJz
	6Ad7sAk=
X-Google-Smtp-Source: AGHT+IG/u9vPHYJsr72JqaDrYLM72r0Mv+gF1sZwvgldiU0c1giVELNbwcEluD8XRP6pboK2QDHicw==
X-Received: by 2002:a17:902:f60c:b0:216:7c33:8994 with SMTP id d9443c01a7336-21892a7a811mr23989435ad.53.1734068833602;
        Thu, 12 Dec 2024 21:47:13 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:47:13 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
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
Subject: [PATCH 4/7] net: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:07 +0800
Message-Id: <20241213054610.55843-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214714_273384_542CD0C0 
X-CRM114-Status: UNSURE (   7.36  )
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
 net/wireless/wext-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/wireless/wext-core.c b/net/wireless/wext-core.c
index 3bb04b05c5ce..1f2a7ab546ba 100644
--- a/net/wireless/wext-core.c
+++ b/net/wireless/wext-core.c
@@ -640,10 +640,8 @@ EXPORT_SYMBOL(wireless_send_event);
 #ifdef CONFIG_CFG80211_WEXT
 static void wireless_warn_cfg80211_wext(void)
 {
-	char name[sizeof(current->comm)];
-
-	pr_warn_once("warning: `%s' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
-		     get_task_comm(name, current));
+	pr_warn_once("warning: `%pTN' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
+		     current);
 }
 #endif
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
