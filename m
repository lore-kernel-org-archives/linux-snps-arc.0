Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ACDC54E4A
	for <linux-snps-arc@archiver.kernel.org>; Sat,  2 Mar 2024 01:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rNqG4SZ3hQSE+7hymaFVLBX15udqqgWfk1i+v9AHmY=; b=N+oGN0VbOgNpuy
	cmNzmnSQjRT/NiWSXU8OHlQufn2ftvQ2ZjtCKux2PnWPNDMeJtaTWUThTteh3kGd1ChVpcfmo4qBx
	k6jJi5IgwIGTycuCPnnwxGJYPeXZpdUco93pLkva4EXrBh1AYoqzc/LXIo6i72RRAfzvR+ZE/AUkJ
	9v0x1clcFlk8+DV1GEHUtkyLCvbEjxHgnUygz1TbM+kf+IQkezly7KMkhbAMz1A8eXcy8DYd5TJGt
	Y9dzsmNRh+ZYXak16cn20rO6fNfOs83mcOPiNx5BhXJ8dwgGm2Wx6RRXcEGaLTEMNusHcyZAFRpQS
	OykTIpB0TGu3jOa4yZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgEWv-00000002WyJ-3yua;
	Sat, 02 Mar 2024 01:51:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgEWt-00000002WwP-0WRS
	for linux-snps-arc@lists.infradead.org;
	Sat, 02 Mar 2024 01:51:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2626429b3a.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 01 Mar 2024 17:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709344269; x=1709949069; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JOHRODJmattJBY3YtQ+51tfBSOEI55kux6+SckPNNk=;
        b=AM5w1ShjUu0L97c6wQZ075mwgMMDgzOFKatq+FiYlRDb3KGOAq1nP0XHgpyvGXgNtj
         CE8JqjEEWcSNhBM+PLiWeK4MHCis4r/b9SJHRcV1ebPAzrXm67R/s/v8OWtjsjBqfJ7y
         +UkVShTzLKBDqUzg25aU1XZN99nmXKyg2cFaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709344269; x=1709949069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JOHRODJmattJBY3YtQ+51tfBSOEI55kux6+SckPNNk=;
        b=qzqGVxlLDyGX3y01ZQRfZtZ++8j6LeyMvmMk/Y/+O77V09O2EeNwHK8aNNCxBViHiC
         1O6W1zrC4VoTHHBCabVBUKX/zemxsitiJgiXB5KLxTp+TNvW/ZIEyscZMlJecGTd1oFK
         XHtRpQx92BgygZZlB9u9AHNGmMMwLRDx9xrCy9rU7ZKHp0ZkIpi3PcSRnEU8jQLLODmU
         kxJjpDdtrb6WTpcrUAirjVKRPtyEDMzoSBoxdWs/VxlYV+2uD81Of67nN0ncmDw9Cxjz
         yT+rJaQVppsJMPzvCGfkQB2s6zp8T3OdlsBj83tB33KBvG0LcWujWK3VBO8gLM/XFMR1
         ESMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi8NBHHCOMsy+OfKN6vHPnRg/58kH8iuGGxcqyODGMZF5ZtLw0/T9b2KZYCX1J389BpIsjExLVvqx+VviwS6popWZdc3ad1zrH+HBhnCCjG8NI
X-Gm-Message-State: AOJu0YwPDf9sTi/AzWnzR4YPzypTd2USuByu/4snxJh7m3JhXBD5mlkF
	z0bcHZu7VLvcAtaXHA2m5rGa8PogFgUBI+rtHBQv3S8wyKuvB+xv1Ht24Sv5MA==
X-Google-Smtp-Source: AGHT+IHRDk8dRy87orC5sOO0fLYLW475IUp9U1sSARPtPvgR8uAOkuMFjfqikjpTM+PGmCnZ+zOW8Q==
X-Received: by 2002:a05:6a20:e11f:b0:1a0:ef1e:a5a7 with SMTP id kr31-20020a056a20e11f00b001a0ef1ea5a7mr3447528pzb.4.1709344269211;
        Fri, 01 Mar 2024 17:51:09 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm12-20020a17090b3ecc00b002993f72ed02sm3845854pjb.34.2024.03.01.17.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 17:51:08 -0800 (PST)
Date: Fri, 1 Mar 2024 17:51:08 -0800
From: Kees Cook <keescook@chromium.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202403011747.9ECFAD060B@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
 <202402280912.33AEE7A9CF@keescook>
 <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_175111_201096_B1B42EAC 
X-CRM114-Status: GOOD (  28.44  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Mar 02, 2024 at 12:47:08AM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-02-28 at 09:21 -0800, Kees Cook wrote:
> > I totally understand. If the "uninitialized" warnings were actually
> > reliable, I would agree. I look at it this way:
> > =

> > - initializations can be missed either in static initializers or via
> > =A0 run time initializers. (So the risk of mistake here is matched --
> > =A0 though I'd argue it's easier to *find* static initializers when
> > adding
> > =A0 new struct members.)
> > - uninitialized warnings are inconsistent (this becomes an unknown
> > risk)
> > - when a run time initializer is missed, the contents are whatever
> > was
> > =A0 on the stack (high risk)
> > - what a static initializer is missed, the content is 0 (low risk)
> > =

> > I think unambiguous state (always 0) is significantly more important
> > for
> > the safety of the system as a whole. Yes, individual cases maybe bad
> > ("what uid should this be? root?!") but from a general memory safety
> > perspective the value doesn't become potentially influenced by order
> > of
> > operations, leftover stack memory, etc.
> > =

> > I'd agree, lifting everything into a static initializer does seem
> > cleanest of all the choices.
> =

> Hi Kees,
> =

> Well, I just gave this a try. It is giving me flashbacks of when I last
> had to do a tree wide change that I couldn't fully test and the
> breakage was caught by Linus.

Yeah, testing isn't fun for these kinds of things. This is traditionally
why the "obviously correct" changes tend to have an easier time landing
(i.e. adding "=3D {}" to all of them).

> Could you let me know if you think this is additionally worthwhile
> cleanup outside of the guard gap improvements of this series? Because I
> was thinking a more cowardly approach could be a new vm_unmapped_area()
> variant that takes the new start gap member as a separate argument
> outside of struct vm_unmapped_area_info. It would be kind of strange to
> keep them separate, but it would be less likely to bump something.

I think you want a new member -- AIUI, that's what that struct is for.

Looking at this resulting set of patches, I do kinda think just adding
the "=3D {}" in a single patch is more sensible. Having to split things
that are know at the top of the function from the stuff known at the
existing initialization time is rather awkward.

Personally, I think a single patch that sets "=3D {}" for all of them and
drop the all the "=3D 0" or "=3D NULL" assignments would be the cleanest way
to go.

-Kees

-- =

Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
