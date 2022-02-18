Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9516C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIbTnYtuFWs2PhmZsDXjQJtkWzf95/4Trl8YmVdCl9s=; b=1egKPb0EajWSAg
	VFvQOEvZyWwr+okFfvXvG8XdXT9ny8W9iNtZS+7G1A7cHHSmurCp5QKQItI8mRFmGWhYrrvRq0/uo
	JgKveBkocXvpdqOj7i4lE3EFHNnDnxCuIv1SlJIqCOqBlTmWLjWW0hYo9w1UmIFQYswJHWV4LadpW
	M9hJ0sO2z8zMTZttmT9NGC6Ev5c3bADG9/0qcrVi9l0cCR2pFNb4m9BdDOaeSrlqz6BvdVsxJCKaG
	M3yGhQetF01sQtHT7wQlT6+isGNLH/afi3U13G5qqOJGIv/eO3gyz85oVAb+Ni7mSlFR6vojRncRE
	psJS6eQjQTfof8zRj0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0Lg-00DoKv-I4; Fri, 18 Feb 2022 10:18:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0L1-00DnsV-9q; Fri, 18 Feb 2022 10:18:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id e17so3570722ljk.5;
 Fri, 18 Feb 2022 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=HwIPNQm6bvP1qyt1DqVyrK6i1IxYBe3pF4kvKD1l9aL3skpcmD5TAiFiTR6vJgOz7B
 t0z9AUGb6zG6pfmU+9BHmWZjjYP8p3JYLtLTfoKdh3BnjyAxS8kyH7aEYnXi01jFZIzF
 573soHdCsmr3/P5ZM1x4mLpZvC48QquGUZEsW8SQQoM18/kWlPpgaxZHrqDS4b16t7Hk
 CPrKR07D3pDZ+6DpMa26njx9Ou6mX/WqALsfbj1Nd6drypXMoKGnpqS7eLYJp4gC/zQZ
 HSj8/Kstfvi7dLE4U0H5uDSTCcko9eMQl/aHEl20oLYR3YeK8yM1gI0YoPwa5+wSkB+m
 kvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=S/oDY9/UPAuJdFxQIZgMaGlKQms/BruBcPuEY4TYIKFPa5CDXD7qCI4y/eAKaUIf2K
 vQQhi47aT4rvSjfyZasDpNwFNGsECjOj8K60BEh1isPmAYRiFME1vcJw2YKQY2+yWkZW
 WdHGJfpm068GRmAZJQX4DC+KTKsFsi5t8RHojRxFYEmkDBeQzyA0YQ64pjE9JtlMFQlJ
 XX+ex1gvWV0miquyPTelbJHhsWF/+RZj7C8OMOGF8JPVV1Qh8otD6viX+8x6wreWvXTY
 fNQ9/jD4C5sRynBxDeecy4e2Z1AH3X1tEwpoToO4R1Es6qBMHu6p5jpt+sUcga/Ha3PU
 33cQ==
X-Gm-Message-State: AOAM531GY6q0B5G1cXZRY6IiCLzddd4vSan0ZEd113Jv2dnk4jtDgnSH
 wxSb2Oj9NTGqDK+FdgcaL+s=
X-Google-Smtp-Source: ABdhPJzoG5dWVDHzQOQKtFLm+HFsVZSdj/YZ6lPLZtzc83WeDz9kMHzkcgdFaN0a4Fhn9IjcgX1EIQ==
X-Received: by 2002:a05:651c:1594:b0:244:d406:5224 with SMTP id
 h20-20020a05651c159400b00244d4065224mr5639426ljq.130.1645179485463; 
 Fri, 18 Feb 2022 02:18:05 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id k18sm207268lfg.217.2022.02.18.02.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:18:04 -0800 (PST)
Date: Fri, 18 Feb 2022 13:18:03 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de,
 mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com,
 mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org,
 jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Message-ID: <Yg9yWxqD4RO7jI2g@curiosity>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_021807_411483_7F3C87DD 
X-CRM114-Status: GOOD (  10.24  )
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

Hi Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
> 
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
> 
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com> # for arc changes

Regards,
Sergey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
