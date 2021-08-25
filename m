Return-Path: <SRS0=KIIo=NQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3310AC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2546128A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA2546128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5xK/ESyi0RhL3sY3FivgpN2DzWKh5eUxIcAUjWUMiHY=; b=SFV/08PqjKjGwXMYmauO9xSVFk
	7v2XupKnzubio3C7w89aNtb47C5QQ4vdDFuA3vKGycdRfcYQSShA+8IngLl028V+IE/LM/cDjZGh6
	pYgTaNoFnRoKiVuxv+pKS/ckH+NZFYOOjv5Mc8JGCYc1DarC5K2kekVVWuciVByLD7IgXeZ1niR4N
	ypvX7CKgjWySYMY9ubd9fS/xwQl3xMMkReEL4RW0nD0z3eHJ/VT53LOFhYxgnnCbXk2tc2QJot6jH
	b4IQzXgZHIYPSdIJmYg7yT25vu+lKowYrRbnjnY1hqYgAAxcjIu9QdWn6z8rFNCFGN1axu196O1cK
	Gyo+5KMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIjvJ-005ObD-FN; Wed, 25 Aug 2021 03:49:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIjv1-005OUn-RG
 for linux-snps-arc@lists.infradead.org; Wed, 25 Aug 2021 03:49:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id n12so2090482plk.10
 for <linux-snps-arc@lists.infradead.org>; Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=nS8Xfv5Np514ewOr71qM5OVYQ4om375+9iia5AAYDaK3OM+hzJenuJr7dAU5cYremk
 lMJSdk/H6gRuWyoAZ38Dxo4xTOwzwlYBTQ7mHvrJGvY2eRlpd9btrTwCc/T4R+lnp2Oz
 tfjjB9XYA84IA+sxs7E0+0bjR3ImZY/NCblTCqWV1vz8ngiUx+QRlaWbVMisVRWW3rOO
 yK85Pgi7JMY0nVAg9WrPZrM52PG/5lW+DmvVcQIgBTfNfdcKCdUHJCl4J+hHtwrGzLzq
 JQXK/nMftIjnNhxqPt/IHdPMmbV0SixoX/iiQ7rUV+IDNkS5Y0uflbsJwBJg2KghrkLe
 Gahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=KdgyKQqdgeckCmjMMFUSUSzpwi8tfEFLPrG/ZJbHzL0d9LOrGAtw7mAx1hPVg+cdEF
 I2IdLTCULhkm4n+N/+n7I00pm7QZzERfxRxQQUH+BN4zdl8/aMul/nT9il49IP8ieICt
 fsAZsF5skdWMu0UYOQv4ac7mZak7ZEBBRU/Zi8yXo97TcuCYHB0DrM62Tzhht7bhYoCt
 AJguYPipoHPhVaG/vsR7uAGmWcRZiQV0SgC7hOTysBZ4JG/J/JFuyNQoYdNzQWRizo1G
 ogv4aARf0qQz1AbqHcN/vLwhk/oNifU0TuzdrBdt0HkU/GikYWU0l3jvx+ywMgVf2k4Z
 mARQ==
X-Gm-Message-State: AOAM530Ts+ViJxA4ia1l47ok1tvGzmClVN8Bi88m6WkzQuYWvrxEE7h3
 M5ekO/WNJxF8N3jas1/FPLnmhw==
X-Google-Smtp-Source: ABdhPJyuW0xG5fzwlVnm+V74njUWhK4iHoDYuJqptloS8iraqWcj5+LzzcKnLTPVDHS2p7IwfcePKA==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr8241589pjg.75.1629863378109; 
 Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm23393107pgk.71.2021.08.24.20.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:42:18 PDT (-0700)
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
CC: rostedt@goodmis.org, mingo@redhat.com, masahiroy@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, ardb@kernel.org, bp@alien8.de,
 linus.walleij@linaro.org, 
 ley.foon.tan@intel.com, x86@kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, 
 anshuman.khandual@arm.com, nickhu@andestech.com, tglx@linutronix.de,
 rppt@kernel.org, 
 geert@linux-m68k.org, peterz@infradead.org, catalin.marinas@arm.com,
 linux-riscv@lists.infradead.org, 
 yifeifz2@illinois.edu, green.hu@gmail.com, monstr@monstr.eu, deller@gmx.de,
 linux-sh@vger.kernel.org, 
 vgupta@synopsys.com, u.kleine-koenig@pengutronix.de, guoren@kernel.org,
 samitolvanen@google.com, 
 richard@nod.at, borntraeger@de.ibm.com, dalias@libc.org, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, jdike@addtoit.com, jcmvbkbc@gmail.com,
 linux-hexagon@vger.kernel.org, 
 linux-xtensa@linux-xtensa.org, hpa@zytor.com, will@kernel.org,
 tsbogend@alpha.franken.de, 
 stefan.kristiansson@saunalahti.fi, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, 
 James.Bottomley@HansenPartnership.com, linux-um@lists.infradead.org,
 andreyknvl@gmail.com, frederic@kernel.org, 
 npiggin@gmail.com, benh@kernel.crashing.org, bcain@codeaurora.org,
 linux-csky@vger.kernel.org, 
 shorne@gmail.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, chris@zankel.net, gor@linux.ibm.com,
 linux-snps-arc@lists.infradead.org, 
 jonas@southpole.se, linux-parisc@vger.kernel.org, keescook@chromium.org,
 krzysztof.kozlowski@canonical.com, colin.king@canonical.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, 
 deanbo422@gmail.com, anton.ivanov@cambridgegreys.com, akpm@linux-foundation.org,
 mpe@ellerman.id.au, 
 paulus@samba.org, mark.rutland@arm.com, viresh.kumar@linaro.org,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-fae2ea79-c261-4e5d-8eae-21e60810a957@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_204939_964911_598EE511 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 30 Jul 2021 22:22:32 PDT (-0700), masahiroy@kernel.org wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/Kconfig            | 4 +---

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
