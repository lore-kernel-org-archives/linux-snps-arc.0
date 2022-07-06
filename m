Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4B2C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIP215AO8jG0qJWyDx1wMceBHn0OMi2CzdwDG45aKag=; b=1FxbHox59YNyQz
	9HneO4/i6Doq2dCb4xR30MIt1A6/yJKePkC+SrtWMgrayZ0AoGSrrk0PtTIGttGSDIKQPa1OBQM9j
	zVwM5Js4pYiF/Zi+n9CM1+1RLfir4TVqQzI7PUKVebaJCVVflqdZ/NGWXDXwuiObzXlznDVhDPtCW
	YbRCdbcua7TowiqgIgUJvXFArRmE+92lalEu+dR6Tq3gk5LS+8lLsNsLc5QebwcTTu34RmrKCzlet
	lFd0SVJfGLvPEcV5aDt0tu0T3OWwJx1OSgi0G160fOWuQcEJlFFZACooGdajUlyWUJN9Eo+brqDLT
	TOnAhuyHcJnPpq69KJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zBt-0070DR-Ux; Wed, 06 Jul 2022 07:11:17 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zB9-006zfV-Jw; Wed, 06 Jul 2022 07:10:33 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfHIb-1ngnEn44yZ-00gr0N; Wed, 06 Jul 2022 09:10:27 +0200
Received: by mail-yb1-f173.google.com with SMTP id j7so19508132ybj.10;
        Wed, 06 Jul 2022 00:10:26 -0700 (PDT)
X-Gm-Message-State: AJIora+rl2jBbHPNycANl+ry8mKjuEfexPHfKgdTkSCEDSlILTTlXUfz
	1IJ1ssWYPMYkqIg+Zl4tmxntkSsabFi3LBfsGTc=
X-Google-Smtp-Source: AGRyM1sFkLoTiaaVIBkcDzO6lGV11chQSm3x6oRhEtv1xOtqIu5uDObFEe7OPQNG4jMZlSfDIkbGiGD4cv9otOB20XA=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr10731679ywp.347.1657091114041; Wed, 06
 Jul 2022 00:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
 <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com> <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
In-Reply-To: <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Jul 2022 09:04:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across platforms
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
	"openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, 
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:RR5vNxY8YnP47mgGxkMV1jcfrLkTyBZIz+xFnQTtMhNigUf0Duz
 3oOFX60CkSIBa9DfspT+2seLsaTz7ZN2Zd5oqe/ZwuIUcrQ44GbRgoVE4YHJ+XypzzVZZAa
 U+cEatKQW8LI0pZgN4bBAeYd5kWiLydBBy6aRRjYi60kEAS+AAHY4js57Ide2uLkwN7Y0+g
 1zhY0BUt36clMXFbqDUUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2f6z2bqHRR4=:YAz+kJwaDWHjcokwDFLU/I
 ihnsa4jZzWlDaeaI1Ftfi1nmCnl4BIyaWqJ8wWXloXWuFcdyTP4nxh3EJWYasn+0wtPw1hM6u
 ZZ+4ZuwUSkPrF4S/cwvhZIzZw2hpwu9+rPyhr0KdjwFY+MSJk5kcKAxU/F4gDT+uyalQPr2Sx
 2dqeg5TAqPQqT55dqnt1QrGQmaXB8eWXx5fGLT1Lo/Ij1jZxJr7+AFNBajDuUCmo2TJe0xO43
 47R9TTG9pxWEXjKVnI9CUDF/2Qi4kZl0kzsDKy8E6YUjXm/MQZHlhqsJX9OciEkTD58+nEI26
 qjbMO8rZfwdVaXu2CWH2BjtR1GqGX2eMwxkSfm9J7UVy5rFNWey1rMHPeGUFHJ6Ukcuf0fJ7V
 3JuWac92ssVecdh22D09SfsyLBU6lNaAHdVsfoIKfdbWmBhDsoMKP6oc4/OPrXU+zbs0zxtxk
 jucuO1gchnsEjQRA+RavnczWhc323bBj52gVfTTTt/RiS9gfbH0yGGQ68nXtq2IcmrKXxk8qa
 cB0Mbi55tx9eZULKHD0aTYcPeiHLb3tTetKBFSWeWDVQ5O4hgrHFgQ0hC84u/uyQY3LOgHUsm
 1i12VZqy8MHp/3sv78AP5XCxmhzxrdkdy5CQBrt5EQAb0XOGlYUPjhD5Cr7O5evzj1ImmGz8Q
 SuHGjiY3JV6mhxj/VgBOSPztZJZgzgRfDDY3W0DsttUXxy+VGpLKYDIgMLCWpDBm4QUFbtnL9
 bIPLSH/8/IflTH+Dv5dM6WKCthr49GO+lfYCo5yjXhKpzOX/uJi1Ri04eGVEwpOxQBfhKQTOE
 btC9bOM0th7iNmg/fEzgABya7nxkiPKFqKGhfsZTSJLdPqRlYww7jWYMENHvfIrRNqFw3lhQu
 GpOXODWKkHdYPmPAKk3oI7WBvKEC3SdnHRLp9CSaBxg7t/Hmk5lR9iia6y0TMMERBllFn4s0B
 EpGlmjA2QYsxGzUuE74hLBQLFx1pflRDMrJVZR+mNGtsVJxW3TFpO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_001031_995286_D829CCD8 
X-CRM114-Status: UNSURE (   9.90  )
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

On Wed, Jul 6, 2022 at 8:33 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> As far as I can see in Kconfig, CONFIG_MMU is user selectable on the
> following architectures:
> - ARM
> - M68K
> - RISCV
> - SH
>
> And is disabled by default on XTENSA.

Right, the list is complete, though it's also default-enabled for
every CPU core on xtensa, and you can only disable it for
"custom" CPU cores.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
