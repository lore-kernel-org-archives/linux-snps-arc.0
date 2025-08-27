Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD98CA0EFF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Aug 2025 03:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXmqc9WeL/3zVf2KqrM/cx67AQFxUiZxFpHf6pxYwI8=; b=vqHdn/UsO6NfJY
	puSzwRxG54FgGtM5nMXoTUiBkEkqn88PRe66eNKBCz693k9ozT8Nj+JL7+Hh36LZUI5aN9+v7VLPg
	N3c99X6Vs5Oyvqe3ynuo89PkDz/iCQKWVddQ91BsfE9ROh6G7Z7ynRMMQjiGODLHrJd26Z/yQo0P1
	pgRiwz12eHqP4ySVb21eJWdu59UK3JFKIs0l/KQqWAnXxQfq92oN+cpigKYN/Oqx23Ng1hJ/qc7/u
	IgkFo2u8Y9JCCB0JpZuRF6WLlq0dKzC8KOEG/CeVoEJPyc8SvgSPUCvNjRRQ4po2gxNAcLQMq3g/T
	BnccEkmsx4tL17PaQmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur727-0000000Drb4-3Ogz;
	Wed, 27 Aug 2025 03:41:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur722-0000000DraG-3ydP
	for linux-snps-arc@lists.infradead.org;
	Wed, 27 Aug 2025 03:41:10 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-771e15ce64eso2273749b3a.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 26 Aug 2025 20:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756266066; x=1756870866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7hQgakYGN92JM43ym9Xl9fivI9QPXuqHNitq7m6h9Q=;
        b=ji9LyBwzrOb7w+Xvrs0kFQa0HQyRwNw6ZaP5KP5sbGvN8RIwbOp7BEr/oUP6IkC6Bf
         1dmPjfbtRcGvlOSfs6SaZOvIU205O4+oivnH3Kfw2demjMrHqXP5FCxX+3YfhKqOEiou
         FqwDxFxZk7HGdavfgOgFyEaUKr+a1PlntqMJ89Y5KOTIpcjiU7yXVw2vlVKUQ8ZNyTxd
         jxQO+iyizOHw7NEb8KTpNtbD0EB41mx4MH7ZTSes+C+NmrHQakcbzaxkZhAKIyNi2ceU
         ALkfrxf4hqjEPiTJCICV3Yq+U5K0DoI4AR8YjJengvWS8xN0BA5I8Nwkn/yQwM7xpRGT
         VQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756266066; x=1756870866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7hQgakYGN92JM43ym9Xl9fivI9QPXuqHNitq7m6h9Q=;
        b=ikRLNO4QQQpvHgjEHv2ioNDYuldZbAPGHxe5TDTnqtiOl+FooWn4Bzj7fH1gDGeq7q
         uiiQE3dhpNCt4AwLemMndt5MBlaCw6RxH4vOBKulw+oPXqiMFac24mPJ6MnavwR44ALa
         Mxx/uFalJ+N/IINAUNl/DUr/nG2aNDD08CSNBthBWGDMItVULYfQHoBpHHS3yUBomMLE
         MDJO0y5+yIb1xV6+mvK41C2d4QpaC7k3I8bQDp3Ea56vE/0FQI8WLX4iYLrxcw1IZt4v
         sYKaeyJZZE7JfHgRuAVaNecB9QpaFiw/vzfykUn228ZqN23UnAV/nmLYz10dgeMf9IAy
         DLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWl3xmcdt06OOgFRqcaWEBOQUcOLu0saach7rMUkCzH8W/H23EK+TdPYPJCzY4AV7HgH1rR2NvZ2c24NlewQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx19SI/ppvYVbxeZCAgmlNZKV58Tngc5usE1pBnMGiFU5QUjU9P
	okA+sk8VblmHPRprgQN/yFXIo9tXMTA550x26RV6gFJ+l41oluAhRbKD
X-Gm-Gg: ASbGncuiGVYWrIgKqmxVPDN0Y1W6S6bTmS/YtJflqmu+5iJMjmK0NVwAMxJwWcRXcV+
	AlP8bLZwrj61sEyoh5rbPRMIgZGLFazx/b4sMM+NAJXnbhV+WIczmuoIG5gSxthGLmXsQtXjfeZ
	as/Q/9Q7X92rWgM9/8uKjWqAfHOrFqNNA2SQ5a86Y5d8mLxY7TXhQWM7wuoqK4Xo3hRKlIAznvy
	qM47EBuSVECEuPrsIQAgrJHHKcOXEWfeBpEdQJhb6pCurNbMFmm5nNZOokFgQ2ZacvmImEA3jmA
	Lwxo2MCnmKHLGCjfhkZOeqCKcW0J8fOTcsnb5G99K9z+5MS0mJMjralsR6wZnWvwU4vzYuToyT5
	NJl1OtIv7k5Jy2dExTKMsV+qYAUKBnt6R
X-Google-Smtp-Source: AGHT+IEJfoCSb3DI07rprjVPxQ5PK2rDzT96h9Gj0pmdTGWBTR1HDwbCJwoFIgVFU4rX5YFZ1j8hKQ==
X-Received: by 2002:a05:6a20:2590:b0:243:78a:8278 with SMTP id adf61e73a8af0-24340d72bc8mr28593728637.48.1756266065948;
        Tue, 26 Aug 2025 20:41:05 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401af16bsm11876114b3a.54.2025.08.26.20.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:41:05 -0700 (PDT)
Date: Tue, 26 Aug 2025 23:41:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Rasmus Villemoes <ravi@prevas.dk>, kernel test robot <lkp@intel.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arc: Fix __fls() const-foldability via __builtin_clzl()
Message-ID: <aK5-T0C6MA5hbdRr@yury>
References: <20250826034354.work.684-kees@kernel.org>
 <87ldn644d0.fsf@prevas.dk>
 <202508260955.2DE50A3FB@keescook>
 <aK5eNDa5H-PNGHpj@yury>
 <202508261911.ECB628656@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202508261911.ECB628656@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_204106_988937_7FB50CB7 
X-CRM114-Status: GOOD (  25.66  )
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

On Tue, Aug 26, 2025 at 07:13:03PM -0700, Kees Cook wrote:
> On Tue, Aug 26, 2025 at 09:24:04PM -0400, Yury Norov wrote:
> > On Tue, Aug 26, 2025 at 09:56:06AM -0700, Kees Cook wrote:
> > > On Tue, Aug 26, 2025 at 03:08:59PM +0200, Rasmus Villemoes wrote:
> > > > If __builtin_arc_fls() simply doesn't qualify for attr_const for
> > > > $reason, I think it would be good to have that documented in the commit
> > > > msg. If it does, I think a gcc ticket and link to that would be in order.
> > > 
> > > I already sent the patch to fix it. :)
> > > 
> > > https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html
> > 
> > I'm OK taking the patch if it fixes real problem for you, but it looks
> > more like a GCC problem, right? Is Clang also affected?
> 
> Without it, KUnit testing of ffs/fls fails on arc. Clang is not

That's a solid point. Can you please notice it in changelog too?

> affected. Even with the GCC fix landed, all older GCCs with still fail,
> and since it provides a improved code generation for arc, it seems worth
> it (compile-time-calculable values will be emitted instead of always
> running the arc instructions).

Yep. This is what I meant. Once the fix is landed, we will not need this
code. When the minimal supported GCC version will become greater than
one that has the fix applied, it will be much easier to spot this hack
and drop it, if we mention that explicitly.

Something like that:

    #if IS_ENABLED(CONFIG_CC_IS_GCC) && CONFIG_GCC_VERSION < XXX
        if ( __builtin_constant_p(x))
                return x ? BITS_PER_LONG - 1 - __builtin_clzl(x) : 0;
    #endif

> > If, say, Clang is not affected, and you expect that newer GCC versions
> > will not be affected too, let's protect the new code with a proper
> > ifdefery, so that it will be easier to drop the workaround later?
> 
> I think the codegen benefit is worth it as I have it.

That's I'm surely agree.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
