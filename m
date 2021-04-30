Return-Path: <SRS0=2M3J=J3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B0C433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 22:09:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAAE61477
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 22:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EAAE61477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LMeT6fR0w1h+oHK6pd/rqbc9Fg7eZDuCilUCUh7ysPY=; b=b+1Gze+4IIpm+ra999LtwhTvd
	7hm1cpyvs7DLzbuMLGrRGaum8JmcVXvUYYSWVhKhrdEvGj3zNJJ4X3conb9fsR8/OvYFdDOXuOaS8
	j7aBju+HUSV4Sxh7PNXwN/c1ivj4JiILSlFsYhGbJ2GoNw7cNqwy28enEA+GySgIJSB/erOx3rfV8
	MN3hr++fN8GQbH/5gac6rEmEkbqFdGsfLj5feLN29HCpOnZBgSkSYMEzuhG/Zl4RleiesS4RyZpzQ
	M4jelnE2oVrYbp1TMa8ZiTRB59NEQ7/a44HIhRcB3Dgg2KqkGTln/GbtqFD2muw3Hb2wnSvZ4F72u
	kIhzQRZvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcbK4-008jGy-C2; Fri, 30 Apr 2021 22:09:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcbHh-008j10-K2
 for linux-snps-arc@desiato.infradead.org; Fri, 30 Apr 2021 22:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B2PZfG2pzx7ZqFXKYqcny8O3yH0zHaMgCgEYwxgafKI=; b=SGzI/nIR8GcOT8xqZecC7KAy2M
 CYgIN3FjKiqmVjfWaoswinMeppXA+AF5oXBbT1SzvnE5errgacKOGovVJm6fhUDB03dFbHaRprJsx
 DbdJ1QvkOQyukyc+zbPPuGLgRXjoZBqC28Mn/MiyNnQp1zuGeLgorsToLsB9G0hFgBIIRjWg9NXD2
 0PzYI8JtUYH8uXbC/NwYGdU2r4LTBOGb9nRdKzpvQ/s+VpvIvGM5Kydkr7yvdtoVJccjpiGhVRq9C
 XReARxkQ8BdfFhPpgkTMYyyD8RosyCL4wGelJQ+1CjIQBS4AdHbElY+ae5UOrrfANajhMVk710kH9
 GgTWWCSA==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcbHe-001heW-Tr
 for linux-snps-arc@lists.infradead.org; Fri, 30 Apr 2021 22:06:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id c11so8330270lfi.9
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Apr 2021 15:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2PZfG2pzx7ZqFXKYqcny8O3yH0zHaMgCgEYwxgafKI=;
 b=Gmc33dvFHMmXR/GuoeUDt2Xn/SVFDn0SpZH1uBECztye2cY51egwBSd6PXXnVpKxSy
 lMWbSiAfoR1p/P1f2X2TKbpYClo9+LKDa62IdiK+MmeyGPMrHQZ36ECDFDHtownHHyMO
 BDLe/gNxJ83M8L7oMNwmcFHFZ36a1fIRkbUCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2PZfG2pzx7ZqFXKYqcny8O3yH0zHaMgCgEYwxgafKI=;
 b=Yd/VVn+s8GVg+P+KLZ6+y3Dz4wWPtS5ZlPJkbgpaU9GGP/grFIEoYAQrpnQW7x/NII
 Lt0XAh/MvMA/SMCjpBBcSR0ezoPsD7flcq8d8rVfXCQatdO/slOhskWHLjI3w0UCYEWy
 dzyajXgUt5tFBKY2AgAEzkba9Zwb/V9uMUrzK52Ax85zNavBvCDDXoa+s5rEh3ouYG+t
 XUnkNXOzpcZ0Aa0fQ/pypRwH/cBTM+70VsDJUKH3MqXaMnamuG9W6t7ons4NDR024pk9
 b7gYgWYf3lzvt2x3XTrzPGYerkQCgKVFF7LcctUJbvkrRWd8WtHqPkkbnR2ZxBKqGK2y
 /bbw==
X-Gm-Message-State: AOAM533yJ4I9mmgT10y5ak0FiP8oKYtfBLpM/a3WeqYBSdwptrUJ111F
 6LoRbuWFTUfi4qB5b6wKH9H5ojg06SvLMs+Q
X-Google-Smtp-Source: ABdhPJxO+b8XNK5d3wDzbM/bnwYTjYi5EI4B1kvHrTXKr4yqSeIqfR2ZoO81CPOqcnkyoOjq1oiAoQ==
X-Received: by 2002:a05:6512:3dab:: with SMTP id
 k43mr4947698lfv.237.1619820406715; 
 Fri, 30 Apr 2021 15:06:46 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id e9sm406096lft.150.2021.04.30.15.06.46
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 15:06:46 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 4so52386183lfp.11
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Apr 2021 15:06:46 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id
 j21mr4523604lfg.40.1619820405966; 
 Fri, 30 Apr 2021 15:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com>
In-Reply-To: <75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Apr 2021 15:06:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJEgjCYzHZFPxTs01p7FMEHKKqXyqwRVBk6KnvHB1qVA@mail.gmail.com>
Message-ID: <CAHk-=wjJEgjCYzHZFPxTs01p7FMEHKKqXyqwRVBk6KnvHB1qVA@mail.gmail.com>
Subject: Re: Heads up: gcc miscompiling initramfs zlib decompression code at
 -O3
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jann Horn <jannh@google.com>, 
 lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_150650_970528_CA26D8B1 
X-CRM114-Status: GOOD (  11.55  )
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

On Fri, Apr 30, 2021 at 1:46 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> I've hit a mainline gcc 10.2 (also gcc 9.3) bug which triggers at -O3
> causing wrong codegen.

I'd be more than happy to just disable CC_OPTIMIZE_FOR_PERFORMANCE_O3 entirely.

The advantages are very questionable - with a lot of the optimizations
at O3 being about loops, something which the kernel to a close
approximation doesn't have.

Most kernel loops are "count on one hand" iterations, and loop
optimizations generally just make things worse.

And we've had problems with -O3 before, because not only are the
optimizations a bit esoteric, they are often relatively untested. If
you look around at various projects (outside the kernel), -O2 is
generally the "default".

And that's entirely ignoring the gcc history - where -O3 has often
been very buggy indeed. It's gotten much better, but I just don't see
the upside of using -O3.

In fact, it looks like we already have that

        depends on ARC

for -O3, exactly because nobody really wants to use this.

So this bug seems to be entirely ARC-specific, in that only ARC can
use -O3 for the kernel already.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
