Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DEC88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 22:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIlEtaa0jONSumSqzY6Uw/B/2w3FdArIACQtP5SBy78=; b=L4JuLY1dx9TUan
	Wy2VQI+IF9MElZQsMdKtpiV+JhfT4o2sVY1NuObbaPlkTkmwOdx34d2KZm77YHlB01FNghGcg08Gn
	cim1sFXsyZ2OKsSOBA3vEI4UwnNxEYJVK8hY3mRdQmyHgGiCXXnH7LElnZWFXfWxRpFXLMUhOaDfB
	EU7NHkdrT1eEd0kuWKF+izkDKob2Wu6n+s5nRy7K9Mujas80CQ52x54YLufbX29+KY0RxjEFoPfjb
	gAzNr+6stjOg5Er4krsXh02e3aJ9mmm5v63E/j3Z3CDLfZ+RKRxCryfpWwgse1xsq4Cn+JroCdZ0a
	zygz3MSP4dCrrf/qwB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6c3a-000000082k5-2CfC;
	Tue, 15 Sep 2026 22:55:18 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6c3Y-000000082je-27vk
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Sep 2026 22:55:18 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f6c7a58so58012566b.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512914; x=1790117714; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=UjmYVQ4EekHgbAxownd4WXtzIR6TaeeiK8gdE7Z5yMPgKpCcWDwqlbuIwvnT5vf0/q
         f//2EZAO245ETQFQsbTLnyCFbB9Qr7Nfej+Xaeqii3ycNfa4Swp6LLxLQi194EEVT8oz
         +seH+aaTGH5hge5b2+OHq4B7+qDDsxykDDSFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512914; x=1790117714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=UA856efDfq/4q5dnudY1ESgzwZZ/6e8iGN9HmNQAZUSch5CtR3iQDiAfVVjFAz3lX/
         0jeuhfB0/RldHM3uj5pdQo9KlGQj0MG3iBwsVpLeWNO2pYSRXn0ysuXeHvIb2KqvKsHO
         RANEvPhegR9k8IXCBD7cpR0fVWoq+z4y8sSqnt1XrDhr75CBPhNO2E6kLFoXBdyxftYk
         XAA9NVT8o87nFcwp7HisiO26cUYmR+4dlO4eBlgvpdeFZoeyFOAfGvJq572Lst9zTmyH
         lki08RLGnEMOTFX+rqnhfyYD905+Cj2bnZGR+jiZ4ug1+5/TBmhvsZwUQ7dipXry6AU3
         O+ow==
X-Forwarded-Encrypted: i=1; AKwUvBxzbrm9j+sbLvK4DZ83/wacalBBqk056J4aeVobHO/V07VkjAczWQWRFdRRDIx3wsMHvYrjDNpeVPBrd/mLoA==@lists.infradead.org
X-Gm-Message-State: AFuF++l1Xbfi9R1HtQf53cCFLsSS+eD+8mMozJEEbS0ZRyoN6AJsPstp
	TuQEroZYeKi8NY6uajHHJ14K1k41TnEJn42khU44a/IRiw+TMhGAfsssT8qvEaDo+qKzwXUCiMV
	/idr3yuv6lA==
X-Gm-Gg: AYBFou0l6Nd45kSPlfjlL5wW2uoL/+QCZMSgS/k5N0I1RpqFUlXsAdtXH7+HoJdxtSc
	SyqKFMDenggj1Om1PSNkofrglHSh2lawX5UMoixGj9IR67TDHQ7AsSaA0bzlq6rXDS7DwqJYP7s
	h0/0yGKMTNYEx82Iw3A1+J3/CECS+d6lt69AmWx97ZUd44j996zBKbwXfN9E3q8MOLkpGovBHwe
	BBF0ewyMuekdXy6/PgFKZCzyQapvesLllxexEG4ZS61ch9SWfN6d9g4Zq8pGvTK9t6HXgGzdj9I
	rokDo9n+2oVtchuBayNg/iIcbu/V6xXSdI9Ewn+Qx1AP2oHANLQd+xh8fW8ukOAhxfOJRow+avt
	xkivY3E6yQjLvnRlEcVyuHuw0hJfE2b2azTuVGp5ricQSue8lC5zWjFW6ahXt3KR14Zr4JD5Pr9
	iGAutzgYFYg/UGDQc+ozpBQSG0ccju6GGYPd2ciquTY8AO8+lr/cTlTah5Vrh3Q4UYz6snxVeC0
	cY+GhNffed4pZEa5KFDpCsBil+AKB8S/cvwJ8WX5dAJQT7J
X-Received: by 2002:a17:906:eec6:b0:c25:8c74:71ea with SMTP id a640c23a62f3a-c29e51dbf30mr9184766b.4.1789512914212;
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com. [74.125.228.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453e23sm33903466b.14.2026.09.15.15.55.14
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so490823a12.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5ryViIAZUlRdbr6JeigUr7dreoZNX7ax8eNi2ckT6sYOl0RJORjFeZtMcU/hdYIf/rY2I9oX1ujhmaCznfQ==@lists.infradead.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_155516_921771_4BFC57A0 
X-CRM114-Status: UNSURE (   9.58  )
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

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
