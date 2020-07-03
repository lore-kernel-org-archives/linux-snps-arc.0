Return-Path: <SRS0=Y0WM=AO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946EBC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:37:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642F42084C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0XlzDZZ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5exd1NM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642F42084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DaSPMAVVyJoeRj8mOlD6If5F1TOpOb4CQ/2wkxwlQnA=; b=0XlzDZZ3TX1i7s0BTIoMWtgsA
	ENV5OEIeak7VBKyLs2QrJssgytuvvB5JLtvbZ2hnNFc/pmhG+gbCvP5NmIp6X1XaLHa2bbA+oOq4S
	nYaItszCNzoO8MnRnzkNZv9yVrYOFWma1FVP6K8piQTT7xSdqRPXJWX+p86osRWoXZeFQ2zZTURSC
	Qtl2qqUxIYkR1ydzI/SMzW3O4J9e+a5ARTuxBDvT1ho8faXpqSKaFtXLmNGFJQ8qS9hM/b3wxFapx
	0A1HyCnYY/T1zFCn2OkIbmk8Dior4qxOFEcY8Au2wrs3xwE+nLnHMX56aLF9Soae81ftPJpKoFDDk
	5G7UKayEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrPd3-0001Dh-Qt; Fri, 03 Jul 2020 17:37:37 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrPd0-0001CW-SO
 for linux-snps-arc@lists.infradead.org; Fri, 03 Jul 2020 17:37:35 +0000
Received: by mail-qt1-x844.google.com with SMTP id j10so24375275qtq.11
 for <linux-snps-arc@lists.infradead.org>; Fri, 03 Jul 2020 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZmZGFK8YuGC/lqjqzKjs6D4zicXenwib9jonqNLwTcE=;
 b=W5exd1NMutGhyU8FcqO4qoPE+oIHDH7lLiNA547RT50O9sb4zdu6Aw/WmK5kakEvde
 sZjnkojSn+MrUs9FSiOc0Srq6UGHaoDN6rkU9d2wyB15Al2f2ISVlXY2P/jK1JnsapD9
 9FnQlcc44Maa+b2t/F5mSkZjF2f1HbhRBAlZa9JJFfmytYXMBzk9x3sW0AKWGzodE8QN
 50Y8CsX9T1ETguoLvhTn9kzLYo5+eQkzqNyU3B0/MoA0OAM7OHdDE6pqVc49d/sXTRgk
 LJsM1cXViIxjfZjwG0V7JATFuKu6ZKrd1xx2cBiJzVpD4KCG5c6JXI74bRR9G79J0ti5
 yRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZmZGFK8YuGC/lqjqzKjs6D4zicXenwib9jonqNLwTcE=;
 b=ExJ+PMa/cUs/+DpdzOUTFH9PRHpSeEiuS4GaZqYv1IC9Bl/sH5tagjrS2JO2sqYzq2
 JZzfK9D8xNdF6FVEe6k2ErI62q8s8QbDBv2Xc5Vw6T5m3CKMTC786vUSXNq/U/kACzq/
 2jiCsa+ZWirmCOCmrfSyxSv+gcllff7A6qwfmq23KA9dSRgYWX/0fvTCURDL3IdEfWIl
 HYQnG32XGY8aD74QKvrGj0eEID4J0jw5YhsH4mTMVgHhPVaAWo3GxsaYmy+V6jokKhZo
 WRbuyvqJOmR1oxqFLZTHlVLP18qngKFUtPv62Khv0Yx1mhygYeU7E9ZEo7u2cwS548I6
 S9BA==
X-Gm-Message-State: AOAM530A9yJLudOloxxxU5fQJllliT5hgJkcv+BLSc3uoFn/EA1vRnMw
 kNGLxMKTS3VwEZQ9Zl8nU6KpaKJ9R20=
X-Google-Smtp-Source: ABdhPJx4OPQd4ZmI7sAkd2rLyLDb5NwpAzB+k9AbBi4VonYZ2yNnE0PrMjstrzOJZX5O5OZvzsmtWQ==
X-Received: by 2002:ac8:5516:: with SMTP id j22mr39759167qtq.62.1593797853078; 
 Fri, 03 Jul 2020 10:37:33 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id 72sm11153115qkh.136.2020.07.03.10.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 10:37:32 -0700 (PDT)
Subject: Re: [PATCH v7 12/13] build-many-glibcs.py: Enable ARC builds
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <20200615201441.31820-13-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b6fa7d50-5f08-1dcf-4125-28690dedaf7f@linaro.org>
Date: Fri, 3 Jul 2020 14:37:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615201441.31820-13-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_133734_939434_CB9E37B6 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 15/06/2020 17:14, Vineet Gupta via Libc-alpha wrote:
> ---
>  scripts/build-many-glibcs.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)

LGTM, thanks.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> 
> diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
> index 6c6615b200d9..64f5713530bd 100755
> --- a/scripts/build-many-glibcs.py
> +++ b/scripts/build-many-glibcs.py
> @@ -162,6 +162,15 @@ class Context(object):
>                                         'cfg': ['--disable-multi-arch']}])
>          self.add_config(arch='aarch64_be',
>                          os_name='linux-gnu')
> +        self.add_config(arch='arc',
> +                        os_name='linux-gnu',
> +                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38'])
> +        self.add_config(arch='arc',
> +                        os_name='linux-gnuhf',
> +                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38_linux'])
> +        self.add_config(arch='arceb',
> +                        os_name='linux-gnu',
> +                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38'])
>          self.add_config(arch='alpha',
>                          os_name='linux-gnu')
>          self.add_config(arch='arm',
> @@ -1224,6 +1233,7 @@ def install_linux_headers(policy, cmdlist):
>      """Install Linux kernel headers."""
>      arch_map = {'aarch64': 'arm64',
>                  'alpha': 'alpha',
> +                'arc': 'arc',
>                  'arm': 'arm',
>                  'csky': 'csky',
>                  'hppa': 'parisc',
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
