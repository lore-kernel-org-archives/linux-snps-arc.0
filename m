Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A537C88E77
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft4BJ8KoAOOQFiX3Kn96Mh1IubOQhnu1B0wnoV4pCBI=; b=Ns376gMwsg2VRT
	3OYwFeks3A4Q9MjZbtJqaBYecu/KOxBNqKsoUR9fPB64FqISCmyiTyh8JfRq0FFnNuXSYgsOE3SUf
	6xviMOcz1K3EfV+BHFhA4E+ZSDWgQZnBukI8QOO0AByrQ8MfMQXUUFjbdDpS/GZTYm+PxetpIdMb3
	fu8GiMloh3lBKtEh3WBewVagBt0KdQs2f28L9UDAOpaV2977G1Xdyqts63cFXXI62ueU/WZVurkjW
	e/LMsyF9cEkqfo6E5HwGiCHgnKcWb3w0IPEBiBZtzkVXcmOr9vZcFUncCsWMSKTMUMp8FKzIlw9Tc
	t0QFbB/0ZaP1UWSMeGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mHb-00000008tXw-3djB;
	Wed, 16 Sep 2026 09:50:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mHX-00000008tWZ-07E7
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 16 Sep 2026 09:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=; b=JyhXmZnstFz21f1LXmFMpmKmaS
	CHqtsTTJ3ilLCVk8YI9cYOH35Q8hNgA7nvBMKtm9RX3gZOQTNkecEFHFvxj3VgjFHxCN6VZJ+BTXL
	cY3P7al9SwVGkrCtY1om9peZ3KF0Zj2NQNGnwm6aTgnxjUekQuFloQ6PmsbEZw+IWVjLWloHIFhL4
	yH4PYHAKRbPnyBBSFut88xkqhLudemTiwDYi6WUQftoMqHtnD7+4k5YyWzywfLO79jCHgmP1Jql/s
	lP8bIARV8ZCu4w+2ss+UGD3uHTvUQqRnz+oatxNedl9IkAEiBAOK/YFetp9kgxK8Fvc+ZAHgbrCra
	TuhJEgwA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6mHU-00000007i8w-1nZr
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 09:50:21 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e620fa473so4413215e9.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 16 Sep 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552219; x=1790157019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=YG8IDu1hpzeRLp17FHzRQhSgPoc14fmyUrHOWLvQmNou39MjUIsKQ6Gs+TVGl1s4Gi
         eQ+QjmC8Lun7yXfPZn/cmsTIUDhXFVaMGAuBBsFfDVvg8hRyB3/gb4wKK2iZryoH6J/j
         8jouLiHOwQjzAkMkZud4zpjZ73U664++80qnGNdeJ7RTZE9NfVmavAmV47oWLafecf4q
         QLZcjQ8JV5nV0JDpkrKNapX1La+SKFhaWkeAekpTi46zXrPv90shxGHIkfHMDp/eFV9N
         AG5BgfVm6/KWZR46/ISmicLqzexuA1X0hKKksIL/XXIcbH0lbDTtMRgQiPigB8Gp6CMy
         QM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552219; x=1790157019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=OGcdswZEr4o2IQvVxzQhYpHeCdEMcUJRtuFtObtLHwSVrPs+gadhb9rbgYnKdnFsZ1
         Vktcx3+ho9tfhjztSI+V6zqyDq+mBci32qjHh9N2DDjOW6lW5Ip11bNUSBG7bj9CMbOy
         9Pbsr+LsqYOAqJCif0C7o8u3oaXHHLbwyqGXJ93C+Y4LfCOyTdXiW73oGqyk0JooWqAo
         X5Cey/okrChmPLRZd1QYrHEJttCG1jqqnNDZon/9gsZ2XQlBHuX2y3jlLA/2miZejT9M
         3mKtwxT8ex7ogGtRQFNlhKgSjX/AAVXgELIVfeIT6ZVxxX3JjCAeSXSH68DoyyBNgDq+
         taMg==
X-Forwarded-Encrypted: i=1; AKwUvByBy1t8l6NSgvn7+m9aW7bIWB5+s1+VaOd8uvTjxzPToIvrmcXC4PcQnLY++nlVY567x4HjuTCkKAts1QIjpQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n60nPXXmh2yWG50AZlgnwb1wF7BLR0HwQgmSoZbFyWppURqtqP
	fV//O+l/MosrsCILWNaT9YBvBSVnPzlTpzY8dAo8Jfr/vviM47fRWFPj
X-Gm-Gg: AYBFou2SX5uOxsTLCuyTdlAYa6ehcGeusQ4yRMkK9WokzVDCoXn88iStv90bvFNMBXY
	GEfJLklZUsVS5gSy4K7lhvT4MPmqFd0Pkw9uLA+fOrjYVY0Ab4a+aIxOTnx+MkP5iZ6q7IX7DRP
	JBmiro7qkUaiE11HAAUJ1ad+2P6HJPNUXUHbl5ZNFXXG5z0GtTKz3fbCmizVHLdaEmEhG7Qaa6b
	bheQJHFqx8P528OgIifIX5uwWJ56Z7uCH2ExLYEUz+2qHYUywfYev4RvQBbF7OnEqaZOL54DJDc
	XfHYzh1GRhKhllocZ0kqHiTyPz9pHU1bL2obnGt0OuNnilejBPcmEaw1SKKrGsUKgMDxAM/j3cj
	vZxt8Wb4r6iuaAYt4YvbnoGNOBzp6UkhllgzGOWlqk7vk12g8bifQsi82EVPn0XPJBtJA1saJpo
	ZuVhJhzPaVc9qnmrNPhc67kfS74fgDnvZReo4J8Z5UOUVS5OiWT6EZIUo2LzZ4jMIqd1GSrOpWs
	SiF6piayTogj3Pty2if5dRTGRcEU5uWiHRG/rNs/zJxOLc=
X-Received: by 2002:a05:600c:4ec6:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49eb732aec0mr19444455e9.24.1789552219000;
        Wed, 16 Sep 2026 02:50:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02245sm84055225e9.10.2026.09.16.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:50:18 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:50:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jann Horn <jannh@google.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, Jens Axboe
 <axboe@kernel.dk>, io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
Message-ID: <20260916105017.13ea5e36@pumpkin>
In-Reply-To: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
	<CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
	<CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_105020_495030_F773152B 
X-CRM114-Status: GOOD (  27.57  )
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

On Tue, 15 Sep 2026 12:08:57 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
> >
> > Is this mainly about stuff like "we installed a file descriptor and
> > then the following put_user() failed"? Because if so, I think a nicer
> > fix would be to have a policy of "if userspace provides unwritable
> > memory to a syscall, just keep going and pretend the access worked",
> > and maybe have a sysctl that kills the process when this happens to
> > emphasize that userspace should not be doing this.  
> 
> We've done that before, where we just ignore put_user() errors and the
> user gets whatever the user gets.
> 
> It is maybe not optimal, but it's fine. You can find quite a lot of
> unchecked put_user() calls with a pattern like
> 
>         git grep '^[[:space:]]*put_user(.*);'
> 
> and some of them are in core code - see the two in kernel/fork.c, for example.
> 
> One of them says "if userspace has not set up a proper pointer then
> tough luck". The other one doesn't even bother with a comment.

I think the code should try to return EFAULT (IIRC that is too hard
in one of the exec cases).
Otherwise very unexpected things might happen if the memory is just
readonly.
If you ignore the error and the pointer is invalid the application will
get a SIGSEGV and (usually) die.
But winding back kernel data because a user copy failed is likely to
be problematic/difficult and at best have error path code that isn't
really tested.

As well as writing fd numbers to userspace, some sockopt code tries to
wind back if the write to optlen fails (which has been read earlier).

I've forgotten which Unix converted EFAULT to SIGSEGV in the system
call exit code - I'm sure one of the ones I've used did.

David

> 
> The scheduler has two cases too, although one of them is admittedly
> for another error case.
> 
> So yes, saying "if you pass bogus arguments, you get what you get" is
> a valid model. It's perhaps not the *preferred* model, but it's not
> wrong.
> 
> It *would* be wrong to take code that already has error handling and
> remove the error handling, though.
> 
>                   Linus
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
