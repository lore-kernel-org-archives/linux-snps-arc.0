Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC9C83000
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdHA7LNMUeHOyAjid2hcjxRKxNn02xOdh1EoxwxZseo=; b=DyjOoPzERw4ehP
	zLlmcp5l9pOnrdQzUNOV2d+V7Df2Gk7WwYdxiObkY2m+ENBEwUmKBqqaNAKG3jg5WLmqNi3TWINst
	wNqsZK3tYozpAw6QeSfJs6Donxb5cHnrFzwNCp3VMl2i9l55Q37qXgIBKML33TmmnR+6Hh05H4BeG
	WLWSj4PuwisVoDDX7Anw/Rckc6/dEcBo7cOI7VOm/CDu22uQghS7OKkt6HVHchRQx6O+fMDCJuoIt
	cl7kXHVtr3pIwESw2hsBLMR4NPjnbe+OHfCemP5gPgpliWt8lHqhZpsIudsFmYuelDNWsSpII9dPD
	65CIsj5Zn1KdjvLarsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjaYW-000000019R2-0fTi;
	Thu, 29 Aug 2024 08:31:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZOK-00000000uHd-2UMZ
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 07:16:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-714287e4083so326939b3a.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915783; x=1725520583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRZz0v4roamBPZuEY8lRo6reatKDFS+11+O4EIK+5eU=;
        b=vjJj8oXKiJrYJ/LMpaGeclaOdOzGQSt8LZyXXDbbZxCL6M54Q27sGpPafCCgxdV6Xp
         2pgi4ZC2Kcv+AUwDTGahv3xXHKwGIC5141/M156kaDrZCnsikKylIfL+6UeNOFjHL2r5
         GdjgviQiaHdZ0E8DFaMHg5mShO02lXXJnjv6slFaGw+D2tPnd+iG2hRln/bx8W1kxTt3
         fx1NHeodilfpR5C2bKHuLjmnvV77ph5wEes6fOVwAj2bGoctVi97X7Oh6zXcmO0tx6lP
         X8Ugo9GgKAKXkUoCVmORFirWeQ8WkZGknVxHh5kCZ97j1Mmpxl//wPBphinZiIRIVKX3
         ZORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915783; x=1725520583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRZz0v4roamBPZuEY8lRo6reatKDFS+11+O4EIK+5eU=;
        b=iypHHCNjfnUL+7x647kBGnrwwz0yfg8x7YS0QQqwA0/uxthGJ5f6DwU9Wke2ixRq3G
         MQOPFqa3IMV1dGu48nmWSLGOE3KyybdTtcTIziHvN45ffk4qjPWIzXpoac0smXLQPfzm
         yKinK0icqEPTEOAv0jdpak+1gpT6YEMsE+nJlLnHndQjMy3jbKSz2uhK3bkT0KB+n3VS
         tbI3o5Ai1nbw0iJapTsbpNHgMcIpMbnmT1usA3P113iKpcjwX7ea3MQdo87Ofx/4YyYH
         Uz2Vg3zQptaHv0Q8e5VV9w/H1AsMrxoVvUXD7HDh+BAJAwK4vALvCOfNdkDBHVnQMqw+
         6blw==
X-Forwarded-Encrypted: i=1; AJvYcCU7PROujbWbF7UJmBRQjx6azGLJJS/XBtGWki5jQa6NSNmCL3Ou4a3hdcKl96IOI3kd5U2qFO4WeQ9M5AsHHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMGjjSxZ9x8qubzLu288Qll+reap/iM80k1ifI0Xqla2w8G4Hu
	vWSFzBBaLZpIwc505Vyh3Ue3yVS1I1SLSLNEKQiHrgdMny7XwgM4tP3782sJYl0=
X-Google-Smtp-Source: AGHT+IESlo3+HNMz8Vyf9gnK2kr34iORO0t8ZckMgQQJOrmm4rJ0EngcQswLax6rU2xQbGZPh7/0eg==
X-Received: by 2002:a05:6a20:6f88:b0:1c4:7dbc:d21a with SMTP id adf61e73a8af0-1cce104dce4mr1887803637.32.1724915783368;
        Thu, 29 Aug 2024 00:16:23 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:22 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:16:00 -0700
Subject: [PATCH RFC v2 3/4] mm: Support MAP_BELOW_HINT in
 vm_unmapped_area()
MIME-Version: 1.0
Message-Id: <20240829-patches-below_hint_mmap-v2-3-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=awlA0FQ8vwXq3Nn6i3BedGsUxTSd4n1W8+rk6Ti/shY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBUtNRaX7W4IPbnI+Ms3hivNnCcHEiLSn/wN2Mfr8Y
 bUwSP3TUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwES8tjMyvNn0V3yhfGTAnNVL
 rI6JakxSy1zhtaNTK7Nm7eOzb9jnWDIy3NjktX5Wn9/XRXLVu44d2/Xri3n+zz1GZcf0P1w88Pv
 nEX4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_001624_687296_207FD45D 
X-CRM114-Status: GOOD (  12.96  )
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

To ensure that all memory allocations comply with the new MAP_BELOW_HINT
flag, set the high_limit in vm_unmapped_area() to the hint address +
length at most. All callers to this function set the high_limit to
something reasonable, usually with space for a random offset and a gap
for the stack. To respect the provided high_limit, take the minimum of
hint+length and the given high_limit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 mm/mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 34ba0db23678..459ad380c673 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1766,6 +1766,9 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 {
 	unsigned long addr;
 
+	if (info->hint != 0 && info->mmap_flags & MAP_BELOW_HINT)
+		info->high_limit = MIN(info->high_limit, info->hint + info->length);
+
 	if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
 		addr = unmapped_area_topdown(info);
 	else

-- 
2.45.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
