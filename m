Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2E8D3941D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2026 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eKoUnM1fsPnicTN/5xyKPEfojQCS8dQ+C+6qfxJceo=; b=KnkVas9KG40Fb8
	2bF0Va4TVzt1tqLkVVrSAdaHlXzi1bfynZxSmJmY5ocFTeoHzFzWdfJyrnEqSss+B1LrA2enVdAJn
	4sN9WQWP6zOkGwyWU6pxPFSuheqNQqBCIdnQfSoxYwtnmUpKb6g7qsZkgZIXon2OItg7X4FnlTdU9
	GhN2ndSVUl2iwXOxMlLSl/OJ3APmxMke4/H6i2iGdAXm2UKVNTzhMnYut8OeQnNztf2l1qSQUU3nj
	DX3pe8HE/CyjRBpMQIrEpTkdGvLDnXAGwUADmU76cqakhESw0Dn0jTV0FM7EN54M8405s8Jni4Cv7
	s+rNI2CjmZFwcJF6ki/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HmF-000000008nK-3mZP;
	Thu, 02 Apr 2026 13:08:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HmE-000000008mu-1FsQ
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Apr 2026 13:08:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso483978a91.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Apr 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135281; x=1775740081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=KdCQxl3xZcTvwf/ge78doEjn+mHpzSrYGXSwfJo3ORUsvwJjXTg7UF94Jq1ZycwQnl
         tbCQFYLs0jjul5E35FODm8eIe4FQwXW/cHtDp7r1agwWcpRu/SPQXfpXcr4BaUUt4y80
         MrJo3kLtGHMobWTQiBA9z5n6gyhpMmGbWypdtyMhKxeX+XCK9oFG9wOFqyDCZiIl66b3
         ate5kJOfg21qhWLWENosvZK2Wh0NzXBeeNHLQQvJjZdqZfgA8HRjqjg7bVKd6st5XUEd
         HDKPa5+6VWJ965400bzTL4YaYGL52VMA0ss139/EUKryGu9pKB8gWK7xanP/fiJPYWaG
         SK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135281; x=1775740081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=BsU1Rd/iHiYo0y48auR5jhnKR2HfND9Eag9P3wPz8ejet5b0PJhARTYpJK/PnO1jLn
         oETAVmsrcsKJ1hM9pm771AdB7nCfpVvgSE14Xcv9406wJNW79xFUzTi4TUP0BhetFT0b
         Z83UJuyLJYMSAv1DpVSA2GW74L9GWNkA844rZH4uZrRjV2sAoujF7K2ignlyK0bPLYwa
         mEdT5FMPPoFOw6IlG5NZiR3ODIHz9CG251+9dhcCns9oUFFI0ILWN0KdtL3P4/rHq65U
         OrdAKcXHufJ7crsgJXtkSG0VoHWmWHc2FwmNgjrWmnoAXvYMlZZH++1pFcnruykteUbe
         ZUaA==
X-Forwarded-Encrypted: i=1; AJvYcCXV4E5p+65U12+QLV/EaxUksnjfUq6UAO33Yq0B26GB/g7K+dzupVCpHvCBbS3nhzFrZ9nHZIG1dODuhozS9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSppxYqh2zgTFtT5GlC5ek28kTw1pmevCtrWE0WSe0fj1tsODU
	UHQXcvXE5dejfQRDYBJpiLlKAdjc/uiYtcyfwz0MAkLDxBriWw0zD3Bp
X-Gm-Gg: AeBDieublxhie25Lhb1v09F0Z6Mn5c3jYnhU5UWhqhQl0g+FEmK/+9rJycbnSe0W9GA
	kTZV5MOFpJqeKOAYJrSdWZaVIlTcyz52l4cr43NIA0GdvEt7AFa84uvFYNZqGX1x3ENOD+7GD1k
	pVWYg1df0n4RcEXXUTv+2soAxJ2vAVdgoasQ7a6glQ9E+v0eEvUlhFnah27t/4UDzjUNUYT2orf
	QZFKN+bKKFytiAhf8JATWkgWtwO2yKaK4ky9Y73kIAz7JVh9LLwjQoD2bznjKNPxwwNxBEBZRYV
	B8WHavdiPtdb7yby6yoyuGdMFLygkebjS92f2+VRUPBuAq1pMAtiRO3Hjz2ae2mx/u3GaN35Ykc
	SBgdAyBn1ANbz6m0kQlzLulNL86XWCHz3A3mP/rWWHBdtskGnCqflgoHQk86jFbquTGCY3wbbim
	N0sialYxsJE3qpI2GDsqt+Y8iHOkk=
X-Received: by 2002:a17:90b:4d81:b0:35d:a412:3c79 with SMTP id 98e67ed59e1d1-35dc7079cb6mr6805318a91.30.1775135280985;
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm7822915a91.0.2026.04.02.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:07:45 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <ac5qIUS5azbWAc9q@fedora>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
 <20260402095747.6efbd456@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402095747.6efbd456@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_060802_369543_D9F7F78D 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, Apr 02, 2026 at 09:57:47AM +0100, David Laight wrote:
> > diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> > index ae1b96479d0c..b4b8dac759c4 100644
> > --- a/arch/alpha/include/asm/cmpxchg.h
> > +++ b/arch/alpha/include/asm/cmpxchg.h
> > @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
> >  
> >  #define arch_cmpxchg_local(ptr, o, n)					\
> >  ({									\
> > -	__typeof__(*(ptr)) _o_ = (o);					\
> > +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
> >  	__typeof__(*(ptr)) _n_ = (n);					\
> >  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
> >  					  (unsigned long)_n_,		\
> 
> That looks like it loses the check that 'o' has the same type as '*ptr'.
> Maybe this works?
> 	auto _o_ = 1 ? (o) : *(ptr);
> 
Oh, I didn't notice this. Thanks for the comment!

Best Regards
Hangbin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
