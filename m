Return-Path: <SRS0=/Vxr=4Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74098C18E5B
	for <linux-snps-arc@archiver.kernel.org>; Sun,  8 Mar 2020 05:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368072072C
	for <linux-snps-arc@archiver.kernel.org>; Sun,  8 Mar 2020 05:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i18vqb78";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sw0sv/8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368072072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX4xbzlMOXjKNMWC5z6B2vXsQWcQHMKUrmKHSuAURuM=; b=i18vqb78PfLa+y
	jSBR6R99SO5YomqHwyAUI8J3KOHSC0xxjbPPB8rzoFk7QDf1UgzDkNuam/C0qin7oEjWtaCDVtg6L
	Y9sSssl4h9v7EeOFa3up6nJbFNyeI4NqZf++VHXOqFfh8qpbEA48/Fv7MTDQxGhZx6Y6ZSQCpbaBP
	gaYU25lByry97De57pXw6d78ZsW56Z1un2vEoaNP3rTPg5AQzmfzEzVJaMHd2C7cOB4N7IWoMESs6
	WMVB3mL5Ifb+4ZYAjGdZRisx8rC9ldUwSE17xYBCk3TfK+gkA0Xq8YCy36zktItGN3xqVLpPeZgCe
	YBS6bi7araHdXt6l9upQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAokw-0004WK-Pt; Sun, 08 Mar 2020 05:45:42 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAoku-0004Vx-5R
 for linux-snps-arc@lists.infradead.org; Sun, 08 Mar 2020 05:45:41 +0000
Received: by mail-pf1-x444.google.com with SMTP id l184so3289363pfl.7
 for <linux-snps-arc@lists.infradead.org>; Sat, 07 Mar 2020 21:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Iq/EgCJM2QtDx91lE051jZHGRISdihSdXBAmbFN6ls=;
 b=sw0sv/8EQjT5tpdKZi+ZQMu9YMS70l3Eyd8Qq5BixBQnKbSs9N/kbAxkV5lMhKBzOp
 1cOhcdwIokX7aDoCFGhH6EpzKPDnlIwU/EaX3s4vqTS8ZURznlQLc7iyBRAIIKzYcO4h
 TOU9GC18sHXrnxUwkH7LAo55Kjob/n7W1muhY5OU+PER/Ty0uQxqcpBFCSC2f2VXimgc
 TIwq0xe0SRjMXgLQ51cjySUHwxyvTKh6/4eFnExja2QIAX5Msf9Cy4Cg7jx3cTPM7pAc
 OLCTn11XCECTQ0pHZ92JHw+0SW6NmIKODqt6hHgjxvw36D5g1RW9z+8LmG610vZnUo/r
 RlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5Iq/EgCJM2QtDx91lE051jZHGRISdihSdXBAmbFN6ls=;
 b=Kz8IwfWPWXdWMsOGkdqaGVGOlx9E0U5Wi5Huq9HeHScq0s5g0ccxNAujeKtTp4qscV
 39Yha6QOgJ27mq7Qr7org9FPk6w2pfh3as2JPT36fHelR5c3mz4+EVj7qNt6SaupCvZt
 7iq/77SXuASqTxkwOGfcwyktVev+CUAVmAu7rGEryFV/JK4vCcKvT1SyiIezmT79MNsK
 1ewJgtWfPo3DWs4E/QYBnRqeEEFN+zjxuiIw2tuqLcvUBXPiJManYsNN12nDFfifnTeo
 2cxsTGk6280Qkc/n3bKrw58W6FztbFOhzXo3fex+4Vog5HFkKpgVBKyq1+56lHH/5DG0
 2BKg==
X-Gm-Message-State: ANhLgQ25u4fT5XdIDWUi1jvAqyQHj/YWfMC7TkAK35HGyM0e+DsvGUEo
 0tQ1j5TvNnEeh+MAa3ad8OY1ZuX3
X-Google-Smtp-Source: ADFU+vuS5Ja2FTrS1MWIHaV1GjNpy5n2KArbnv6ScmqYozpKtsgZgIGbCiojbVxd/sAtX6MjR0mZzA==
X-Received: by 2002:a62:aa06:: with SMTP id e6mr11596428pff.32.1583646338123; 
 Sat, 07 Mar 2020 21:45:38 -0800 (PST)
Received: from ?IPv6:2601:641:c100:83a0:2cfc:b031:360c:4b81?
 ([2601:641:c100:83a0:2cfc:b031:360c:4b81])
 by smtp.gmail.com with ESMTPSA id m9sm7199767pga.92.2020.03.07.21.45.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Mar 2020 21:45:37 -0800 (PST)
Subject: Re: [PATCH v3 12/17] ARC: ABI lists
To: Florian Weimer <fw@deneb.enyo.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-13-vgupta@synopsys.com>
 <87y2sci43q.fsf@mid.deneb.enyo.de>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <af189394-f710-8356-3b08-174e9d8471a7@gmail.com>
Date: Sat, 7 Mar 2020 21:45:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87y2sci43q.fsf@mid.deneb.enyo.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200307_214540_232083_6F26B50C 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/7/20 7:20 AM, Florian Weimer wrote:
> * Vineet Gupta:
> 
>> +GLIBC_2.32 sysctl F
> 
> This looks like a mistake, given that ARC doesn't even have the sysctl
> system call.
> 
> I think the current way of suppressing that involves creating an empty
> sysctl.mk file, as in sysdeps/unix/sysv/linux/x86_64/x32/sysctl.mk.
> (Unfortunately, the ports added after x32 forgot to do that because
> the in-tree default is wrong.)

For now I've added an empty file and in a later sweep we can remove all the empty
ones as you suggest below. Thx for taking a look.

> 
> Alternatively, we can remove the <sys/sysctl.h> header first and turn
> sysctl into a compat symbol, so that the symbol will be gone without
> further action on your part.



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
