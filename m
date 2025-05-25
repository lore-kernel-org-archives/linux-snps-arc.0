Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADB3C54ED1
	for <linux-snps-arc@archiver.kernel.org>; Sun, 25 May 2025 02:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPs1eGuPIQnMVmqToUOXEo+JG+FP+zIiIt/1I+b2dWg=; b=ysiW5eb3wxe84u
	0BZcbxAPyHappwPUi5Kyawb8YzOmqC1WBXnb2kmXQ1pCXjNKhtrwVfLqE5jX1EbquDh0/3xoTFSfv
	wdMJlAD0ZBL2hG6TBR5f+VfRTnOf1P5F4knNxSVyYIRJ58Op3cyqbX9FdZeVB43OJ7u5FvcuSLtLv
	hvOnVRAJtEXy7sfwslEdyN4Wjc9Qb7ijiHl5xcOgtFW7VsRCXbk2e7ivuKzaT5QnpbGdZocyO9U+o
	Ygrx8bNbJi0tKPEr6VXHECoCtjKvKpXHEDbVCP5d3P+CEihiKA4MsAgS1yxb+j6UgHhSY1FMT4Ffh
	YIykuySipBqfVoC+jotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1MM-00000006UM2-1nyy;
	Sun, 25 May 2025 02:45:10 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1MJ-00000006UL4-21UF
	for linux-snps-arc@lists.infradead.org;
	Sun, 25 May 2025 02:45:08 +0000
Message-ID: <0a211ae5-2f13-4b07-b670-39e06ab8a917@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748141097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtwG/KauWlVi/boJ/OWdJCCXw4dm5aA+kAeMNpkMKbs=;
	b=h3YdnPJPptOPwI5k+HAm+LK5YdSV7z5UF8dzowi7Cr9hoSPUV/as6iFXfiJm0HtRJHtVdT
	rhLHRGiV0lfMoTTWYwKls1g9qzFsIVOPgxnObMdgjDFrAp0vw7x3BN5yZbU6AkS/AqJ/5v
	7YZ6HE1zFbKlWjabuV6R4e4GG0+9IuM=
Date: Sat, 24 May 2025 19:44:51 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,arc700-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144826.1292329-1-robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250505144826.1292329-1-robh@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_194507_656554_66C84B6B 
X-CRM114-Status: UNSURE (   4.24  )
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

On 5/5/25 07:48, Rob Herring (Arm) wrote:
> Convert the Arc Core interrupt controller binding to schema format. It's
> a straight-forward conversion of the typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Will you be taking these thru DT tree ?

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
