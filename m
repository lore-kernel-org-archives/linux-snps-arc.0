Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FEAC982D7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj4HL9SI1itsxMLWhV4gqPtFJFpIKbyu0ZACs9AmGs8=; b=fMUwwvOs3kGARX
	NpYkvuH+gcGo+XdJ8gymxPe3sYlbmwS1QZBnFe+cQfhxidRwT0dyPxITLkgxWZqhBgFq9EwL+4anj
	lSDXoBiib4nn7a6Nw4gqCX8ig0kylxRK6GJDxuCgS1oNLkxMQAthWQDBInvnsKLItUZsvjoYp/aQQ
	qOvSHlOvnmFuyNjZce1LmRZ17jjKJLcM5k+j9YKWr5ozMqC19sC9wigFtb3sm+1C9XQIIpYsZAlDy
	CvdIg43i3OHyX1eXmbsJOpA/CEzft/3kxtN9/P3Zfv2wxAXRPNwUhfSEXStij/EvmO1GBrCG6pqQa
	NQAmdnoZsMZBS3RQjXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ubj-0000000DtYl-3qsy;
	Fri, 18 Sep 2026 09:10:11 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ubh-0000000DtYD-2rig
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Sep 2026 09:10:10 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e620fa473so3033085e9.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 18 Sep 2026 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722607; x=1790327407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NEA9aek5vNuu7I8nEFfi0rFdQ9PD9h+hnZ3KY6uKWvs=;
        b=sBVIyg6qK07ULO8duQHFuOAT/QMdBXo2MgQ66g2nccB8DUpSJCddSXeDq/kIP12Vdy
         2vyltUi6tKmuHK1ObnzG2BSObeoX7JfmOICst1eZy9g08KDQR2AjcYC5mu6GFtnkxr4Q
         M7jlWwJ7jHRoyQX2os9eGoEAdIT1GmyR8Q1i6aNo9m60a7rww1B/dHhzS5pKErRkxiY6
         UA+dkASUX24hH63c2w0xRCWsnMkL8rwoyqlGC5uMmKU3wegBGhy4R4cXhiG8B6pGgS20
         EM2wQu3pMYLnwWScU+ISK5xKN6c3DfTKVuuwwK8uUqazqK++oFsyYe/9lLT6BYDtGnn0
         5Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722607; x=1790327407;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEA9aek5vNuu7I8nEFfi0rFdQ9PD9h+hnZ3KY6uKWvs=;
        b=l4rfC3EL0C6yID+qEphsEUGGvXfA+vWV4tTCqTwdiutB3iylzQP8uHGcj6yyp2FMTm
         w+WJcC/ohpywpm17RMIdR6unYQySCO8ctl6dTCZ7G2tlS19CgAFaxbadbiszabefP794
         ZWqv9Q+2GzdorweqCJwGIB5vx9vt3OkiZcSdSlU7OEJ3T1zDPbLrrJeTkFCJmvj7Ulec
         M95mbtdkw/NyQuF3LrE8/QyAWafWqWdY6UhbN0o3+RpViBH18Nx9Z5+hlPS7v2r82XHV
         veTww1m4oJETc5LpeED7R1xbOWH5lmIwFr7oPCq6pnAMMNJmob7EPVbCbRxTs2Nd6hRF
         Flhg==
X-Forwarded-Encrypted: i=1; AKwUvBx03gYYD9tqZHK+1MKVliI+BK5pGdARa0JdPYQctU2N20NufYTFEBuWD/YFhb5NFOVyV12fu9M6fRQzeAlqBA==@lists.infradead.org
X-Gm-Message-State: AFuF++kCnDZm0oITbyMso8XpSTIKXgCdGNAsf3FTb9uhtDcUMTk+PkdG
	17ofXQWGtJ8R1xPsAmQ3gOYaP440unLENobXz7mk1JTCE9RJsOmWWMMzs39H0Q4s
X-Gm-Gg: AYBFou0vJrrwDGltH0I8EtwYYBwTcDN4S7e45C28XjaGROChcMbQw+zyaE34Gm1uGhM
	evfvCAQ8XHGIphAdHH8uCSCwbtg9cy171Xrsl5Byo/M/ZehSkDtFOfiCsks386S/uKvPZzIUR/B
	FQtnY85oSlcHZPjV44KBGuuAY5m4bZGY2c76NPuvkKp97X4aAKUGpLPx2r/B55W6YO9fWjp7Opj
	TZSzeV2aLd6kE1tjHbY+U4/RF14Zcr3qilIsjHubP5gDxjI5DXe+QoBlDvL4CZj0Dd4xwe9jmqj
	553uOiydRdBKehNijckFITCgRch1VnMzOMWx3xERSAVcNwk90Ek999wqcmybyUmjNuTsfMQ5N9V
	YK7i/7ejtfURfVqo2GiXV6yeMl9vtcSS9GTKbnRl9Sf5SQuQQLQeBhRnHbN//DUdIhuQuzdtMvP
	lYcGm5PgymXhLojzKw+d3UZBLdOK0GdKzttWF5VwMdj1Wr8RcHF6iYbfHrOj9bhq1tIJqhdc+5t
	hqrnh0VEQuBg3orMKEKuBSCCSMrniIMORDz
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr18187915e9.21.1789722607156;
        Fri, 18 Sep 2026 02:10:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm31503375e9.1.2026.09.18.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:10:06 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:10:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta
 <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chris Zankel
 <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E . McKenney" <paulmck@kernel.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20260918101004.731bf2e5@pumpkin>
In-Reply-To: <20260917163830.3748-1-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021009_744316_AA4F66DF 
X-CRM114-Status: GOOD (  18.54  )
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

On Thu, 17 Sep 2026 16:38:25 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v3 of the two byte cmpxchg emulation series, wiring
> cmpxchg_emu_u16() into arc, csky, sh and xtensa.
> 
> v2 tried u16 as the parameter type. David Laight pointed out that
> this does not compile warning free when exchanging a pointer type,
> because the switch statements in the architecture macros instantiate
> every size case, so a pointer cmpxchg() type checks the two byte
> case, and the (u16) casts there warn. v3 takes the old and new
> values as unsigned long and casts to u16 inside the function, so the
> call sites need no narrowing casts and pointer exchanges compile
> clean. The function still compares and returns exactly the 16 bits
> of the emulated halfword, which matches hardware cmpxchg r16
> behaviour, and a host test of 972 cases across both halfword offsets
> against a byte level reference model still passes.
> 
> David also noted the missing pointer to integer type check in some
> of the macros, so cmpxchg(&p, 4, 5) compiled silently. The csky
> macros typed __old and __new through __typeof__(old), which skips
> the check, and sh had none either. Both now type check through
> (unsigned long)(0 ? *(ptr) : (old)), the idiom David suggested,
> which keeps the pointer to integer conversion explicit while making
> the compiler reject mismatched types. Both of his test cases now
> fail to compile on every macro shape.

You fixed csky but not the others.
I guess that could be a separate patch (maybe series).

David

> 
> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
> 
> Thank you, Paul McKenney for suggesting this, and David Laight and
> Arnd Bergmann for the review that shaped all three revisions.
> 
> Bradley Morgan (5):
>   lib: Add two-byte cmpxchg emulation function
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   sh: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
