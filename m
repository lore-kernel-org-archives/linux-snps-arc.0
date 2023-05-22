Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B90C7EE31
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqEDlnEkJ7SNYSni10d072QDnlRGJQeQU7W88SSvKhw=; b=zxunDFag8Mdh8N
	+zr4a7Hpp5tOqsqJsIGVxfzPxLCUE7pXTXdfo5Edt2k6SHypEREyi8lYhkVjS+jw9fkaKBLafUsKT
	dC3AVFF7blXCG7jkF/123Ti/McX9h8kAYLisreB5RCUK6dj//hWO48j27z1AeRlUZc4OKT6R4QxB3
	QbQ3rOtUjhUO+GBUSfm/c4zOVDwe/aw3yDSReohZ7OHoff2djpssRmVCh9vo1PeLrn+5LNQZmgQdR
	9CfEe2fY/soUwGb6CbAlyoWRXyipJXOkvDO8N8q6+Mgzp+ybeKUTKpIsN2I098F24gvrPlhfa+Vpi
	ZZ0gX9XgmeVExDymZwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXg-005ZY4-1O;
	Mon, 22 May 2023 07:01:16 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXJ-005ZHm-07
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:55 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af28a07be9so31002251fa.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738848; x=1687330848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=EgeeaYxHiw9wjOAGc/5G+LN0c3KUHNjvlMLN8uS8AnOgASES7fyW/rsQOHqr9DJIm4
         Q8pNdnQ8gVkoZSj/+upHrsi/tavYgOTyzBUdlAtcr2Kh9ffmMPH4gQgxiD9jwMMKDMI+
         CuKr2WQEU8br9TaFssSRKesDxf+IahbGC5Zx0cbDL1B32MIMmQqJEpul0X/k5OkwgL/p
         biyoDSbwAxtoAdQjplEuS+uPbUVkhGZwVNA6jM4DVWvLhyshkUq3uEnshyu8D9Pr1j1Y
         dtZh4qZurb2FlkyA/lCRl9W6OQ/h4jDhIaJlJh3cxPH3CVc6wzd8qQhjtgUMnfkuf6pl
         /E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738848; x=1687330848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=VP0aIGaKRGopFcv5u/cnnawH0E9eEBrR+VsK6CHgBtpBPMSqNa+/fTJx30U2NJCjJM
         ZCN2/xM61YtvsmfJ+2vz8IxiAZ+6RqOwo7FmNsf7hiauBVi7TUqCUN8Pw5ZXhqWyv4KT
         PaKMFGnQDS72uODMEUWKTIVzJ+fi9GQS4OjeVOvN3/BOlRsvmzEIw2jdrC/5SJfF+Pd/
         ljHrFng9Q7Fx62cOWbNu0e84IEfLeppR7KU1EMKgfhMvp5WwBLQLOW0dWoU7ocsqDJdj
         IPrTIzy4FlJM4fyirpoJQjMshngL+GnD9di68fBwMCcU/5vPbk/+q6NZE7LwiDvGcNVS
         oDnw==
X-Gm-Message-State: AC+VfDz0yh72p56of/VlFS8V96sqJwxpgB5WWUbkTAXpUgRjiCvWCtsu
	R5sunx+kPDrAWxqhh5hx8UsyzA==
X-Google-Smtp-Source: ACHHUZ6ayjAtOwTfIDOzMqX5t+1QrYhY8xbXfr8AsE31hPYz8DEGnh0exphBKO7gszaQlURwHEoueQ==
X-Received: by 2002:a2e:9588:0:b0:2ad:aa42:8c0b with SMTP id w8-20020a2e9588000000b002adaa428c0bmr3570722ljh.35.1684738848500;
        Mon, 22 May 2023 00:00:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:44 +0200
Subject: [PATCH v2 09/12] asm-generic/page.h: Make pfn accessors static
 inlines
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-9-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_000053_099052_C5D53CC2 
X-CRM114-Status: GOOD (  10.43  )
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

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry we do the same change for pfn_to_virt.

Immediately define virt_to_pfn and pfn_to_virt to the static
inline after the static inline since this style of defining
functions is used for the generic helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/asm-generic/page.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
index c0be2edeb484..9773582fd96e 100644
--- a/include/asm-generic/page.h
+++ b/include/asm-generic/page.h
@@ -74,8 +74,16 @@ extern unsigned long memory_end;
 #define __va(x) ((void *)((unsigned long) (x)))
 #define __pa(x) ((unsigned long) (x))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+#define virt_to_pfn virt_to_pfn
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn) << PAGE_SHIFT;
+}
+#define pfn_to_virt pfn_to_virt
 
 #define virt_to_page(addr)	pfn_to_page(virt_to_pfn(addr))
 #define page_to_virt(page)	pfn_to_virt(page_to_pfn(page))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
