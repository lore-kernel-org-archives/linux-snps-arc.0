Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AB9C46467
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Jan 2023 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQzXqHgpZocgHivBGM7KFOnvgz/s6oHl5TF+Axz7gXI=; b=ZaTZ94GtSVMAvq
	FkR8ACb9zFEIEgh+XV4JVNxSQG00A3qK1mgatdD9SJViepZ+URDxOCZmwm8zYOhFIzssim6Z92Yy2
	wsbJzR14dqUaDu7+feM8WpanEbXbuW6C11aSIuH4a60YQu52jLBFz7IkslXVF1TayYdgN/FlD67Io
	//5yOPz0gW3/bQPU9ZUc/TOAVYvsKw1n8HT4dV68MpN35VYGcJ3yIneLc/q+g13vKNzMA546h391q
	YwqQe6xXn3gksCS7y2Og6xF6ZqoNXp+OLxZZIpdoYKWQzcDRPS817Paa6cHr9ugD4nifUfWrZD1XL
	JHZ+OUGP2DAQXVpeteIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQND-00Ar1r-Ge; Mon, 16 Jan 2023 14:22:07 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQAL-00AkJP-Iu
	for linux-snps-arc@lists.infradead.org; Mon, 16 Jan 2023 14:08:51 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id z12-20020a4a490c000000b004f21c72be42so671429ooa.8
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Jan 2023 06:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aLyjOgahBmwz+XGK8EXvuwDSR974hJxXOIDViO4EOno=;
        b=OWYzO3lpi5Nw3/8H8GfE8C7eltOveqsF+bf5SSXcNvqQr6S1Pa8Pn/7DisjRJ8hbaP
         bSlbqERRjHLUmD/AYSuHGh7BI0zkb+N9jO+L1RJrJx0ptKZNvHBeTI7JfVn+PC0fYNz0
         aDOOGMwc37WO/nMHgB3WjpvVos8abOh4m7yyCKcfpwGEi2UFnoMKX5dOJkO4eSXXnyAh
         XNvXwMSehdcDIqP4W7WihRZFp8nA4ObUq+fo8M/PWhbL1V/vf5TqJEc43PaxXZDtw2oV
         F+dprwqSmm4mw+C23JtTFO5ozv+Fdj+qtq2cG1ggsvbatkldxan/tSo8d3VYciHtXa9x
         Cwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLyjOgahBmwz+XGK8EXvuwDSR974hJxXOIDViO4EOno=;
        b=QM+FQrQlZwKkn5onbR2KXu2gD0NLmI4vyebcCimTTvBqWiFVog5768Qmm2GlUH+Dfi
         xUxut84OByC/xNaexXLFwx5OXELxITAInYSIjgWfSaHYfsVWU0+v3owLyUqsRY0sB6gg
         r4p07kwjAI0re/YKlJrN+Lzy5T54fgbTptE+wsd+E37XvGGr7Gx8oSy3JhVO480vMaXF
         XL+1KDog2qlGb/voXSS8MmI42kBKMsNoGkFeLJs0uT7dFQlxHmTVcij7dK74MEZ8s15J
         J5TS0T0k+aYKSSTIgqxWESNAwIkbQ4T4rOF29arnjePXmYwtlPlatCUCkIlcvZI0PKBW
         mDvw==
X-Gm-Message-State: AFqh2kqmeMjiNA5i6lftfKdDTFYMU/HvuX4LNGotADjkyEIamkDJQqku
	uMSF61o2BGNUVDBu6B4dpWNWiA==
X-Google-Smtp-Source: AMrXdXuzZ8ojngZoSXDcsPAJlX3Gk3mxYWfW3ivIFilewX3lNVvp+JmdAwbatHok5STFsQfgsc8Qmw==
X-Received: by 2002:a4a:d417:0:b0:4f2:d483:228b with SMTP id n23-20020a4ad417000000b004f2d483228bmr2202418oos.1.1673878126940;
        Mon, 16 Jan 2023 06:08:46 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6? ([2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6])
        by smtp.gmail.com with ESMTPSA id x10-20020a4a97ca000000b0049ef7f3b2c8sm13368042ooi.48.2023.01.16.06.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:08:46 -0800 (PST)
Message-ID: <dc4c5fb7-271f-8f97-626d-1deddcb4048a@linaro.org>
Date: Mon, 16 Jan 2023 11:08:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ARC: align child stack in clone
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org
References: <20221221161946.12090-1-kozlov@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20221221161946.12090-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060849_734999_DBEBBE38 
X-CRM114-Status: GOOD (  12.10  )
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



On 21/12/22 13:19, Pavel.Kozlov--- via Libc-alpha wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
> 
> The ARCv2 ABI requires 4 byte stack pointer alignment. Don't allow to
> use unaligned child stack in clone. As the stack grows down,
> align it down.
> 
> This was pointed by misc/tst-misalign-clone-internal and
> misc/tst-misalign-clone tests. Stack alignmet fixes these tests
> fails.

LGTM, although I can't really test it since the Synopsys qemu tree does not
have qemu-user support [1].

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu

> ---
>  sysdeps/unix/sysv/linux/arc/clone.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
> index bd924890844a..f32c83f17a65 100644
> --- a/sysdeps/unix/sysv/linux/arc/clone.S
> +++ b/sysdeps/unix/sysv/linux/arc/clone.S
> @@ -41,6 +41,7 @@
>  
>  ENTRY (__clone)
>  	cmp	r0, 0		/* @fn can't be NULL.  */
> +	and	r1,r1,-4	/* @child_stack be 4 bytes aligned per ABI.  */
>  	cmp.ne	r1, 0		/* @child_stack can't be NULL.  */
>  	bz	L (__sys_err)
>  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
