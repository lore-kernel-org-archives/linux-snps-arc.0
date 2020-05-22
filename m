Return-Path: <SRS0=AMLI=7E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81D6C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 19:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D4A206D5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 19:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taGi8rEm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dsp9uIUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D4A206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMLqKIJA+o6batJf9KkI03WpBJ0dPoXOw7MbK7Fb4Vw=; b=taGi8rEm/7j7xnx/4585JAfCj
	xlxJ9ssgh0l/DQpcuPoSvB3VvyK9Lb8GPl0tSXhL0/GxGy0TtAvtS9gosBPE5Lnb5zWND9nGF75Kx
	U+uPuWwnHzl3MelImfoM8Sjy3bL/AcbsgaPuEGqEMG7FLYcKwO5dvyNC3YTkDhuRkXI/ahfkcSuqE
	LJwMu1CEGkKKDfZQpa+r+/iKhZkMATG+WwSVoaweWJ3o5jUxUlICKE8r7jQBk2ZSFbvmIvy0FUm04
	Lkl4vpe1/qB11q5yT/lJNFi7MwMWgaOkqRD37zIt6k4vqYAIrfLctWSw8QrRt3cY803XbRg2ikjwi
	pDWjGl1Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcDGW-0000BO-9l; Fri, 22 May 2020 19:23:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcDGS-0000Ag-Nl
 for linux-snps-arc@lists.infradead.org; Fri, 22 May 2020 19:23:29 +0000
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66765206D5;
 Fri, 22 May 2020 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590175408;
 bh=bXZEeDnqQ8pc/bjS8vchYZuh+kFAQrGp2mx12nXsRPg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Dsp9uIUWGqanhKiv6bL7aBsBy9OdouDgDo2Rzvz4C1nxxf2B3+ZuHtzjMZHbXQ0RP
 OvGJV+LOZ3fL+mtlJEE1SsVFUACWpds3uCr454Rd0ngh+hog81q5VtB48LAGIYYhZI
 xXlIsxt84hAOIbTfweLYuOgaJb6D+LQVVDNPkpfE=
Subject: Re: [PATCH v3] Kernel selftests: Add check if TPM devices are
 supported
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Nikita Sobolev <Nikita.Sobolev@synopsys.com>
References: <20200521144344.1886-1-Nikita.Sobolev@synopsys.com>
 <20200522163714.GA10319@linux.intel.com>
 <20200522163745.GB10319@linux.intel.com>
From: shuah <shuah@kernel.org>
Message-ID: <b433d7c7-38a2-098a-55c9-6f8cc13f7230@kernel.org>
Date: Fri, 22 May 2020 13:23:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522163745.GB10319@linux.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_122328_792195_2DA10FB0 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: linux-kselftest@vger.kernel.org, Tadeusz Struk <tadeusz.struk@intel.com>,
 shuah <shuah@kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Joey Pabalinas <joeypabalinas@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 linux-integrity@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Huewe <peterhuewe@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/22/20 10:37 AM, Jarkko Sakkinen wrote:
> On Fri, May 22, 2020 at 07:37:17PM +0300, Jarkko Sakkinen wrote:
>> On Thu, May 21, 2020 at 05:43:44PM +0300, Nikita Sobolev wrote:
>>> TPM2 tests set uses /dev/tpm0 and /dev/tpmrm0 without check if they
>>> are available. In case, when these devices are not available test
>>> fails, but expected behaviour is skipped test.
>>>
>>> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
>>
>> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> Shuah, can you pick this up?
> 
> /Jarkko
> 

Done. Applied to linux-kselftest next for Linux 5.8-rc1.

thanks,
-- Shuah

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
