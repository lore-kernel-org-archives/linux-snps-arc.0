Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225D9C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:40:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD48B6121E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD48B6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EGFy+0ilS05lhWHHk1g1StsDESQVbiC89fA7bi3Lx8M=; b=CLA3hzXVuOb/kwjzm0M9j8H82
	JILK1M7qr+mReN/HVte9MatQq7fIfKSdG2OPq4Ha4osAgrmhXjxgTCgfqCAiDRnD+Ru2wHAhKjDIU
	2XvQbX2080LZXWBAj3zHmhUAoi5m24JJuiwdqO/V1uVAz+dEUhNcUO44T6Wr0PMQaFOYRQECmNFSX
	3Dir8QDjuL5iYsge534uUssSTgTDENk3pN1fm6D0kALDVYhYB9oFdyRZc3AB7BVLQpIcmGpqI/ltS
	sa6godEZsSvFOeuiXKgS9POyjmPxOeUCXc2NqI0azhf3ZXVaG+IltKBL1hLAuB/kQkBcTlw4953nu
	i6JJU676g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEye-005zBv-AW; Wed, 07 Apr 2021 20:40:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEya-005zAj-RD
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 20:40:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id l1so9944802plg.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+lepyBu06/G+jZBNMFOzAhCDgL8Tu4oHzkuCLgR3tM=;
 b=E/8ayHkniJIJgZ1e1vj7r3csuvbXyJLnnoBh+x+yp0VTrbSBpuB6BqUyRXJavmaPmJ
 4qkaFVnH5W6zMAfezN143Fgsqo+TUPBaScEvaZeqGneS7qZFqf0VWrDJtMXi+4FQWcMg
 gx4hzelGeOr+0pcTrstNPkfUejoaa1XdZL/U2sr8tVG7S/dMslgU/wsBrm2+u54ZyS3N
 fsSVFrHHJGSM5Eb3v1ZITt8FXjvSZcLheT/2VIz8Bu9cjyKSZT5SuuwblfRHdeNCyz7g
 CV/TRer3MET1JJ04laLXcfYs/Akuuw3SayVZ6nVDBf+tI8NWCPVGJ69ofAtpiww+uAwG
 iAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+lepyBu06/G+jZBNMFOzAhCDgL8Tu4oHzkuCLgR3tM=;
 b=Pm+wrieDvg3ArpwOwDfXRtJ3pAr+e1EHkDfVXaFo8e7wKtZT8rETh2ByAcsjtvzCA8
 ykywzgE0plSy/Sf0NRS1H+xX8Kg+TdBAswqXCaYlIA9cmIO1o5f+h3Vs+ewVWqY2s9dR
 UfG1GuTh+wmIIR6SNnU+3UrIopE4uh0AAvIlLTCoXPtbMx1rdxX564kAfSCMVGCrW8cc
 AbK+e8pTkraIbEDY/hsydJxfKQpx4nm1s6tJB5O/OszK+pCC0GmKm330qXEdBcAJhSq/
 zP4MupwzrIfh8TRDOCndlfrD4A8osonHUG+BlRkb1ZkTPR6aoqZJzsksX86bO8h+fSjT
 u+Iw==
X-Gm-Message-State: AOAM533YbVyIyGchX07rq/hkWejXkK2VIYKonm9bsEUn5hCrnkYqgBWe
 j27qQcJRcUtDuqZ07lGKUaHIytETCs8lOQ==
X-Google-Smtp-Source: ABdhPJwzbJTFb6LJQWh1QqHe/wWLu2gwIn+O7v0FgiDz4Ji+aMb7GjANktpzV4ifGUbUQ3BdluMfEg==
X-Received: by 2002:a17:902:d507:b029:e7:370d:b3c2 with SMTP id
 b7-20020a170902d507b02900e7370db3c2mr4688247plg.73.1617828035421; 
 Wed, 07 Apr 2021 13:40:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g21sm6262988pjl.28.2021.04.07.13.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:40:34 -0700 (PDT)
Subject: Re: [PATCH 16/27] tests/acceptance: ARC: Add linux boot testing.
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-17-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de3647cd-e50c-818f-e968-54c5b253ff56@linaro.org>
Date: Wed, 7 Apr 2021 13:40:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-17-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_214036_979761_B1DCEF10 
X-CRM114-Status: GOOD (  14.21  )
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

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> Just an acceptance test with ARC Linux booting.
> 
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
>   tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 1ca32ecf25..b5a781b6b4 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -138,6 +138,26 @@ def test_mips_malta(self):
>           console_pattern = 'Kernel command line: %s' % kernel_command_line
>           self.wait_for_console_pattern(console_pattern)
>   
> +    def test_mips_malta(self):
> +        """
> +        :avocado: tags=arch:arc
> +        """
> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
> +                   '20130217T032700Z/pool/main/l/linux-2.6/'
> +                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
> +        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> +        kernel_path = self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinux-archs')
> +
> +        self.vm.set_console()
> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern = 'Kernel command line: %s' % kernel_command_line
> +        self.wait_for_console_pattern(console_pattern)
> +

Careful with your rebasing.  This is obviously not what you wanted.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
