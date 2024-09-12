Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF2FEEE25C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Sep 2024 21:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQopQi1YGBqaM7YWzDct/rp/feo61XGJXxTX7zvqH7w=; b=jV4o/Jaj1Obeye
	WZ3cFHxRhB3vSV9pkaHH8UZRjdqT5ajJCtgjlHRaTnXNbgAXB1C0XMaBrIzU7MzK2iWvlxpiM31x/
	aIwg2jRQ9tHgSh1yGD2eKJM0WuAu1ELdYzsLKaJLidSk4q9PoM/Vw7UOIES+C/lujRZ/UmYN3+Fts
	MHReJtKwT36PqWfsZoNOEoSe4CEqaIjMlKwmyALvnhAMoLSoSenyMYn8AalH43tj8tFrvcIxQmm/W
	9PAvgwg16Tq5WmlN88v4ePh37aAO9+iGdNYeYwUhMmEXlsFS9bAC4vfrpfnm2msm5rlUm+NbA1aXz
	BzHviG2xFJR5pB3Kec7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorAi-0000000EGbV-3hFJ;
	Thu, 12 Sep 2024 21:16:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorAb-0000000EGXt-34Z7
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Sep 2024 21:16:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-206b9455460so12026185ad.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Sep 2024 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726175765; x=1726780565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=CeynN1MMTWDAV5J94mhF/HiU+OYoKh/AjgW68LQDlBlD4Enm4VvPRgW4ZXLrg9wo5K
         TvXgIpsxwIOuASD6Ny8k9Ph54SFXX7o/T9eh7t8iefxbihRFLvNzccPrSnXkoir9lZqo
         TDrsyd+MsfqhHqLfiwDIcuSSsF490sSKwbmEmr/1n71EHUzbc5r372pKjrsdC/3v2O5Y
         7doyVQfXDMkQwUck1WuiP3/21tRABY0afAs5HdjlepGuuDhSUUn3gugcaxCQpQpvJIPT
         02qiZxND1QLd+4g+8edTUuaBLwPFlfPGN0kh3hkDAnXRGX2oHFOHmdR06urQcp0Z3pjg
         NqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175765; x=1726780565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=oOxSzcNQfGvOCnrdMrJBkXxNHmW2imX15QHW/GHCFucDdlhJnQ4JCQ+xElpaGfVzQr
         pt8APQ5UM+r3d5kExteieVu7his5a+QkzKbiNKNXD1Ch6jyQovyB2Ky/0SSaYEfBxTIQ
         3TYS9zXnL8rPncBzfkcIKcaNjW35e64tG8x2ZQlopDUKc1uTIeTy/jIjrpkajlDR0/JL
         2zn72gJ07Vkt9sJ/+/lcazMONaZysGvYaO4whuL8UkFJXr26xrz2AKN5lFSH0roxK7EY
         RHKXCiLxJKE+AG5jmXLwA3zvHFCQd2XkTX6Hp9yT1ypAmCCenOsbIN4Puz9BfIcWpLsC
         FGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBUe+jOARV+B5U2dMQjjguj4aEjwDhM7L5yRxSHsazHGklQAp++tfOsSG+OVzWPMnJ2onu/am5MgxDLeGHLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ytovlSU0zY42U2ntsaDLtI0oAtRrhaquoctOmzldQkbP6P7z
	qMMjeu6w5HIkSl5ze4x+Suz+dSnOHOL9i4T49hNKphPlhqpH9+lmaOaeoa2D+0s=
X-Google-Smtp-Source: AGHT+IHUzjdPrj87uHlM3yWrW/J5uo4qx0FxZorL/y/ZhI47SL1dDJtb3OuvF/ucYmZPS3S517PhSQ==
X-Received: by 2002:a17:903:41c9:b0:1fd:6033:f94e with SMTP id d9443c01a7336-2076e61ddabmr75358475ad.27.1726175764569;
        Thu, 12 Sep 2024 14:16:04 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af47662sm18233275ad.93.2024.09.12.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:16:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:15:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuNaD+zAXiAulc0n@ghost>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuLIPZId9aHcAY2j@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_141605_807595_4593FB63 
X-CRM114-Status: GOOD (  27.49  )
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

On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > Opting-in to the higher address space is reasonable. However, it is not
> > my preference, because the purpose of this flag is to ensure that
> > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > applications that want this guarantee to be the ones setting the flag,
> > rather than the applications that want the higher bits setting the flag.
> 
> Yes, this would be ideal. Unfortunately those applications don't know
> they need to set a flag in order to work.

It's not a regression, the applications never worked (on platforms that
do not have this default). The 47-bit default would allow applications
that didn't work to start working at the cost of a non-ideal ABI. That
doesn't seem like a reasonable tradeoff to me.  If applications want to
run on new hardware that has different requirements, shouldn't they be
required to update rather than expect the kernel will solve their
problems for them?

> 
> A slightly better option is to leave the default 47-bit at the kernel
> ABI level and have the libc/dynamic loader issue the prctl(). You can
> control the default with environment variables if needed.

Having glibc set the 47-bit requirement could make it slightly easier
for applications since they would only have to set the environment
variable. After the kernel interface is approved I can look into
supporting that.

- Charlie

> 
> We do something similar in glibc for arm64 MTE. When MTE is enabled, the
> top byte of an allocated pointer contains the tag that must not be
> corrupted. We left the decision to the C library via the
> glibc.mem.tagging tunable (Android has something similar via the app
> manifest). An app can change the default if it wants but if you run with
> old glibc or no environment variable to say otherwise, the default would
> be safe. Distros can set the environment to be the maximum range by
> default if they know the apps included have been upgraded and tested.
> 
> -- 
> Catalin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
