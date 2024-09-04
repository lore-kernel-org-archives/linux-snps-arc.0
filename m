Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0833CCD4847
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7E7UJBRk/TeT0S8vXjaICb1hYhcCV5oLnQoCeulaag=; b=k4a00n2I31P+ghAEs6KMyiAE+c
	wdXkKSYQVRyI1XNTIvSwt7gi070ItuSIL7pHt/sRLNFxbX5eZTCSPqfk7oDYlwUnY3GnkOlZpOnH1
	eLvlXBqyyO0ax5w382qmvZ2nW5j2zJTVZ+l9yZV0+LXxogJjQiYseXDj7UEpX42Vktj//1VEDlpFw
	lilehT/qec2ivwVV1o6KueayyP8kBUtuPOR2oWVCA9uyTPDAjBr/jJppWqhxiMbMR8QjBLwpqnF4o
	Ha2BQlLbM2//Fi8fg4JDHQDMSh6omAZb4aXRjP09Zlpz0fo0IlzCjP1DV0Ckp69N6zvpbGMrNJiq5
	yHVL4Mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slv8d-00000005hmG-2IIZ;
	Wed, 04 Sep 2024 18:53:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slv8Z-00000005hgg-1vhB
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 18:53:53 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-714287e4083so6162211b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Sep 2024 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476030; x=1726080830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=0o7Kc3O8GAUyxmkU0U9IsUX63ZJs4Jt0+kGrO0Dzvo72ogxln5wk1c6rWQxCRuUnD9
         gVdUE9Yz8y2rEi6f46uMx1b6GvcGeIgE70u5TgeOTDvfDyJIarcvxpYZlGFHVvBehK/d
         tQFkW6C+oTqgAczzt1gPIqkQyH+GH07g/ei2ZCZVu7m48bw3Qi58oO7x+5UMo+mFWwaM
         MURQsAQ4OrGE7B2KyYlLXvvx/zOm0n78lLSYUaAiQCBgvTUIJYdl675OT2vZP25hjtnC
         g73jFmlfw7Mea28cqHJPcmf8JHIQuQtAvo26IRBvWe9J3ovb2+aZqjpzNRQWL19GQUBB
         H5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476030; x=1726080830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=X88IYoX+TTz+qW3atnvNgzqLAO7D4PVIVyj2t1j7B2XA0STUbW8eabLUedR/OUnhc4
         zf5vb4cpjtRLUc3InU73d3aa5WZOFZpxfu2bItmq/K5tVosnqYIrOvprJ64Eli51WPjY
         IGTfV/ZTwnOb6s8v0O8DKZv3PHNKHUpC6/iJS4ZC6DoAggE7+yc6GiaDVGTblAe04SlW
         4dmJjz4rhK4Of9DLKLOPGHV0ap20MGvW1QIZBW9BzV9cIZu/Qr/4n9aZSuO1la2YMEIi
         vJqdahtTUCgqqv1lSQfByZVLX0Tukex1GYzNYyOp0WEadcBxsMtaLq8fbVH9IhFSHs+I
         dmgw==
X-Forwarded-Encrypted: i=1; AJvYcCVBd4RlQkJVnAiswWYQ05HYywsCXrFKpwdc6KTuyYXYtGJvhx8FN3k/3EuLSc+OyABKVQ/Z3u81JT3MfD0+AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkIXiPok/6N8NmzwTkpp1AMnBKtMXG4Q19Bs5WThkPuf8up4C2
	pTsybOFdxJqg4wnRO2IOhZL6AXo5Ql4a9Bb5gc0kqeWh1hr3baxMYkodF1z8/uk=
X-Google-Smtp-Source: AGHT+IE2IsoC0LRmiLcI1CkvV1DU3vw4DUJdyqp6MID1n1cX+56uyYB7jBo1wGGq/wkl04oTY4Plng==
X-Received: by 2002:a05:6a21:318b:b0:1ce:cbcf:aaa9 with SMTP id adf61e73a8af0-1cecdfdea62mr20770394637.36.1725476029832;
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778522979sm1947597b3a.30.2024.09.04.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:53:45 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Message-ID: <ZtisuRySfREHjnN/@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_115351_762385_DEE8947F 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, Sep 02, 2024 at 08:08:14PM +0100, Mark Brown wrote:
>In preparation for using vm_flags to ensure guard pages for shadow stacks
>supply them as an argument to generic_get_unmapped_area(). The only user
>outside of the core code is the PowerPC book3s64 implementation which is
>trivially wrapping the generic implementation in the radix_enabled() case.
>
>Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
