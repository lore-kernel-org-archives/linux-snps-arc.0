Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068E2C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 May 2022 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2nPO/hSmWAAngnWLQMI0rbm1+Z+lGbwXltmFRBWwIM=; b=URqL8VFPgIexG7
	9hVllpdcgH/5/QaIlcxZwq3O51I2VtOyPlyQL6iB6t20z302fw44qqRblx6NqPHLm1MwwtbNQrw9k
	oyjBXudOA1npB5sYRAxSvrOUT5nGzR+Ierj36yCXY0VmwzdzmnNiXwS1h+vJR8TUQNYKd41XCU0Tk
	v0zGihUl64DQTZ8w7aUgUOgy7cPT+NvX7atIYYEnTjqlIqlAqJHnlUY0bqVr7eWuhtC7yG+hvyxYE
	aVrZRvab74AOt1JHvDQjBqOPrZzsg0yhTgdGSKEpaJuBJtqpEqq8rZaK9OWCMrsomXM4A7R4MzeZp
	c4sglk2v2qLxbxfaqAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhhd-007Z7N-Kr; Mon, 30 May 2022 15:53:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhhZ-007Z2U-BP
	for linux-snps-arc@lists.infradead.org; Mon, 30 May 2022 15:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653925983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
	b=TpFAE+FS1J0MN2RDjXKr2PtcGFi43Y0xzw2eamXgc8G8lnWUkIJCvXY7PerVuw57vIF6Sb
	/RxD4xLI+8s/LL4q7B+aCW2K9S4zeXWraTG/8vZF0PZ2AM3oSeiEsoE6J5meZJtmN4jKLB
	MJOeoYH4+SEGmrAPhr1bb0LSNUsLr7g=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-4ToZhhyoM3SR5b-VbZYkyA-1; Mon, 30 May 2022 11:53:02 -0400
X-MC-Unique: 4ToZhhyoM3SR5b-VbZYkyA-1
Received: by mail-il1-f199.google.com with SMTP id j5-20020a922005000000b002d1c2659644so8585654ile.8
        for <linux-snps-arc@lists.infradead.org>; Mon, 30 May 2022 08:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
        b=3wyjf3GEJzpmgDzAHxxw48sAtrjTK40SujwaWd8Y9wDd+AXcl2hrWW37/c756A0iGc
         yxmEK3f1gEqaIfZxBCgj/pQXim7E64dq/qtk2w/5d7xF+r8/KMUWRRxpp7m7OpY3tJis
         RB/00xyt4iPd+TXtd+yRJZVHfOgrSNozVyxTa4M6I4fBoh+PrVhGjtZPv9Ul1+PbSFNP
         qchlMDqnnOXW7tD/RZPMxxJvcBTwK76tohyfERRyTAxdBeQdQYXVxGnLkcbuYNYSKZ7o
         0fFNWoxTcUqMl1sFGAG0ShURSMyIvpeXOkz8O+i0cuhmqcxYTIgB/JTbM8RsAmPraGNM
         vDCA==
X-Gm-Message-State: AOAM532iu/WfP9xjNlkOq6E0MWBxdS1IR638uYIgV5BhVxDvTp4+uuNv
	Bsy/6OduPdwdIzsR0P9gh1wyWSl+N+qYgLNuN2ESQ8A0UhMEUz7x11JzfoHnV10EBHsoKQpTZ/2
	iJPgijaz+hvEohU0gtlFIMUGffJHly1np
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857390iow.192.1653925980595;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKQIoyyqGc41UCjMUnObS0GZ5Lh8IPSVLY8KDGIOa5YRMfMwdzANPXLWIG/1E7oUnwvcvO1w==
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857337iow.192.1653925980357;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id 66-20020a021d45000000b0032e75bfe344sm2781109jaj.171.2022.05.30.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 08:52:59 -0700 (PDT)
Date: Mon, 30 May 2022 11:52:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Will Deacon <will@kernel.org>,
	Matt Turner <mattst88@gmail.com>, linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
	linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	Jonas Bonn <jonas@southpole.se>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	David Hildenbrand <david@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
	linux-parisc@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Helge Deller <deller@gmx.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-um@lists.infradead.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	openrisc@lists.librecores.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	Paul Mackerras <paulus@samba.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"David S . Miller" <davem@davemloft.net>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
	x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpToVpjXmdFqGOpY@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_085305_543378_2588C883 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> 
> 
> Am 29.05.22 um 22:33 schrieb Heiko Carstens:
> [...]
> > 
> > Guess the patch below on top of your patch is what we want.
> > Just for clarification: if gmap is not NULL then the process is a kvm
> > process. So, depending on the workload, this optimization makes sense.
> > 
> > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > index 4608cc962ecf..e1d40ca341b7 100644
> > --- a/arch/s390/mm/fault.c
> > +++ b/arch/s390/mm/fault.c
> > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >   	/* The fault is fully completed (including releasing mmap lock) */
> >   	if (fault & VM_FAULT_COMPLETED) {
> > -		/*
> > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > -		 */
> > -		mmap_read_lock(mm);
> > -		goto out_gmap;
> > +		if (gmap) {
> > +			mmap_read_lock(mm);
> > +			goto out_gmap;
> > +		}
> > +		goto out;
> 
> Yes, that makes sense. With that
> 
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Looks sane, thanks Heiko, Christian.  I'll cook another one.

-- 
Peter Xu


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
