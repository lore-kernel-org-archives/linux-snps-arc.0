Return-Path: <SRS0=VMfk=CT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AACC433E2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Sep 2020 23:21:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3608207FB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Sep 2020 23:21:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qhRNT6jJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VJ8P8o8v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gILSoNb5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3608207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfLubDIRKBP/hOLs3BwAjzOVA4ppH6Iyw5LzX7xk3v8=; b=qhRNT6jJwLjV9ZXPM2+LB92SU
	W3uhJgKXq4YIpsmw1zcNEoVqnp8m10SB/fBkNgM9M5S1CN9Hjq4jn3OgMaMAVCECwyXSK5Snzm44H
	PV0ScHQ5OMSSrpVquKse3rZsZso/lLl9XjP+XS4UTQP5SncYbkmhksF3PY1vw0Yvybnz2JwJY8Vnn
	u3ptuKOrA6bEX2P7oY01ppKnTDHsWOA6aZYkLZ2HtVpJ/I5vc51GBQu9jv3GyAjRhFOlBeW7gosS8
	RQTW2eAKJA626wx2awF/tAtL8cyNGxrBFXgzazWa6Nc/MEIlUClqG/tnMNZ5mp4WQF675evcsN+n4
	p7fnH6dQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGVt8-0002uh-4n; Thu, 10 Sep 2020 23:21:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGVt5-0002to-Lr
 for linux-snps-arc@lists.infradead.org; Thu, 10 Sep 2020 23:21:56 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 66F9D4025C;
 Thu, 10 Sep 2020 23:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599780113; bh=sSRYAQZCjK0QkAGJRCe5c0JjrnERTERKUmJ0hLJlgxc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VJ8P8o8vW11iNj+6AgCr/7UIQBV7fTu367WJA9iXXdofdZaSfs17fntEH8gae4BJe
 1DzTIDiS5MYl9mwQz+vRYGZv3jBgrMkv/jpJvT0Cyx8q3v4j9OrElZjpyv7amUq8VJ
 uISMPYKvLgmNHOF9EudXXQBS3SITomDGyIH9Yo3lzp0G+O51qjVomHmOlgxB1glYaD
 BpdQTw0i2AlHdgF47dFROlLa5Zohx50/qwEa6GReijOPb0UJtD2+MOFrAy7uv6jUrV
 vToLIR7S3JiKUI/GY4HzsTYeBE/hI7k9i7ZH5eSwIa2vHyOYj1/S/laWt31q+SiG9q
 FwWXS9UsLiMmQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8F489A024F;
 Thu, 10 Sep 2020 23:21:49 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1953B801A2;
 Thu, 10 Sep 2020 23:21:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gILSoNb5";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duUmZHAgTp/9ic5NAHRwxPDEhOps3hnG7D0OLvwZh0EK42uIi6luj9idscr0MI59NO0HKCu+HeqJTX83BEFMmzwNWvlZHuPhzgoEh/MEwK29w3oVyQYa2NSB4do5uTMPUIJ9ObZiSRHfYbzz0eX/AgyZGt7CgxotIX5VMaucAuETJfcY8bHYitfFygvFieiYtqUUJa6+7KvstuzuLlBPPEz6Tv3mDJAw4vtKH8vKKWBuqiQJtwLXJDvEgunCY97plecNuWwXEymiyABIWQO2DCDSWRKVCB0tQA5KA0aNYNMizWiKSIjsdsw+VH9W/1FUvek4y4Qh4/klmH9YYd7hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSRYAQZCjK0QkAGJRCe5c0JjrnERTERKUmJ0hLJlgxc=;
 b=CZlxxiLVlmiaj1I2EANUZq7bdH8tiel/5qAJtLQXaZjqAzkReIv4D5g5CqVFx42iH4aFyxlQDu5rYmaj4gR043uU1sPl2cIuwXLT1NZjaYsIIMt0a3yADm4pNHdd3PEbTwG0sbNzis0sQOoQposy7l9Tk0T1Q0lLLBm446qfA2ALZPJK1rUMr6bxY2weSD2xXKXecMI/FTR9TDAVvnAFKYwqJZ8aTzDx5Ih1PCq1JPGooX9pJini5VellRJugMwYxni1xce2HdKzczM1pHWUEpU9Nw22WByHgY/BiTXtQK4T8PDElBOX43csUseru7Ih9v+Tb/xajAw4cIXqMRzlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSRYAQZCjK0QkAGJRCe5c0JjrnERTERKUmJ0hLJlgxc=;
 b=gILSoNb5f9cvHsqCRpOeQ8YK0U+BicOM92sAKxweWIRrJQXc0cWCkL/BX8CWmEH11p3Yt7Xquq7IuRDs396IH84eEzNxvsz6y9JFR+nee8c7JkY9uNCje/ggg3CmccBN5jUcVvWvx5j8s0IQFGjsUqn2eRoLxfjzxVZbj+plExM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2631.namprd12.prod.outlook.com (2603:10b6:a03:6b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 23:21:43 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 23:21:43 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, Vineet
 Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] binutils/ARC: cleanup
Thread-Topic: [PATCH v2] binutils/ARC: cleanup
Thread-Index: AQHWh8kkJWaDP3nzjEqSzXbfxCchqQ==
Date: Thu, 10 Sep 2020 23:21:43 +0000
Message-ID: <3b18564e-be2e-91b3-def1-6c3591288ecc@synopsys.com>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
 <20191222224144.38603994@windsurf>
In-Reply-To: <20191222224144.38603994@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [107.3.145.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a8d95ae-7958-4130-bc99-08d855e047cb
x-ms-traffictypediagnostic: BYAPR12MB2631:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26312DDC62EEF9204BE9FD20B6270@BYAPR12MB2631.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iqwxHW95Z3WTRBjagUwOfBkQZxzP/N+rMoaB8FzPxyZ9L7XY3JalcbtgX6e4IHljiX5etiVx4WiBkWNicpQC+66T3RatGFwPKwQ4yXmbPl8uuDcZEzRfOX1giFc6c3zV29lGr4UMVWWmkZZP0ponqVwcY2az63J/4gYDhUvSK0tU7M68+or79K5gc9OJt75mLjgPUPewrTt+o99rEQ6HoifZtVWKNc5O6U35psyZmJpzeJKDckwE5JVFPCsKwackwOiLLQvFt92SmT38v9WIbZmRKCcJ07owlB0iB+FkTasfkDyAkb2jIncsHUvC5zwggJUoESSGWi9QkgC/rQgreAo3zEm7HNX12mZXq0J7GNCx8oNeC6ooGb6bnji1gaks
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(396003)(346002)(66446008)(64756008)(5660300002)(36756003)(66476007)(54906003)(186003)(110136005)(6486002)(66556008)(8936002)(86362001)(8676002)(478600001)(76116006)(31696002)(2616005)(2906002)(6506007)(107886003)(53546011)(31686004)(83380400001)(66946007)(71200400001)(4326008)(316002)(6512007)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: c/yRjCqFzGu/RoHic9IM6NxXmWG+7Ggiv/1A1ETT1kOWIUXssiCwtcWEeWOG8X2kuPGdHmoEzqecB8oAi1tpi5qxPw0313hIPFHsUijTT6eQybi0BLSq1IHXA+zs7xJp7JDGcJaj5ECJ6/fjLEr18F2vIlwIOJ4cYIqgf86/swPESr/3c1Yh8R1lhCUZR4GDuQp9GmQYZPHpKpA7aniFzpUoqGcBeKzDA5OtImRiJL6Tx4HnwmFVqbMO6xCSFzM5ZsOVmjMMwvnyQE+l7miHpdqxtoSAlGgGFrqYxWRhBtl7sqRnFCniruIlrOtDMahAZrp28dWSOBM/YRihjN/SGFzcP+iKBzpl+volIB5wyG/GMCpoc9HDVF/ngv8a0jLerduBIisLJhh7w48CAX+0MMaerOzaJM2TQlAbjEurkqLRWOeMwA2ZZHn8q6QPbeon7d7rSCMXJyziW2o99LLy0w42gaA3iSQuA+9rcQQasqz5kDss1hgnBTPTjiM1PteHdzEUVO4Job4LbMxgqUlgV5jj1FINmxwEVN7j4jMRHTFgTaI/+EkEaOoW35Fh+PEIlG96iYtuPItyvaNJXbgbFQ0RV4XxehXNDqEnvsTHNp8TOLgbgtlIFQnXWGWWBusLyZdQo/2zFwzamDdzUuoyPQ==
Content-ID: <3B7A169E110BA9428FEC5D904BF6632A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8d95ae-7958-4130-bc99-08d855e047cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 23:21:43.7915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Gq6NkBqvlX4gLwjrR4KBAeXS1Mhmbgp4hsyL6quvdYOIecgmH9B6CBrqZpBG8Ff+XgtiZAuwNI/MLRNbqIV/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_192156_090921_0C19B42D 
X-CRM114-Status: GOOD (  26.30  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On 12/22/19 1:41 PM, Thomas Petazzoni wrote:
> Hello Vineet,
> 
> On Tue, 17 Dec 2019 13:32:53 -0800
> Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> 
>> Remove special handling for ARC - as it is not needed for cksy etc.
>>
>> A nice side benefit is that the ARC specific version now only needs to
>> be specified in single place (vs 3 currently) in binutils/Config.in.host
>>
>> Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  package/binutils/binutils.mk | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
>> index a19d6940f7c1..3ae5561d67d3 100644
>> --- a/package/binutils/binutils.mk
>> +++ b/package/binutils/binutils.mk
>> @@ -8,14 +8,10 @@
>>  # If not, we do like other packages
>>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>>  ifeq ($(BINUTILS_VERSION),)
>> -ifeq ($(BR2_arc),y)
>> -BINUTILS_VERSION = arc-2019.09-rc1
>> -else
>>  BINUTILS_VERSION = 2.32
>>  endif
>> -endif # BINUTILS_VERSION
>>  
>> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
>> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)

Looks like we need this specific thunk anyways. When I select pristine upstream
binutils (not ARC fork @ github), the above forces it to download from github
which it should not and will not if the tag/branch has not been mirrored there.

>>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>>  BINUTILS_FROM_GIT = y
> 
> In fact, I was wrong, this also does not work, in the following
> situation:
> 
>  - You're using a pre-compiled external toolchain, so host-binutils is
>    not selected/enabled, so the version selection in
>    package/binutils/Config.in.host is not used, and therefore
>    BR2_BINUTILS_VERSION_ARC cannot be set to 'y'.
> 
>  - You have binutils enabled for the target.
> 
> Then, with your patch, we will no longer select the ARC-specific fork
> of binutils.
> 
> Basically, for the target binutils (just like for target gdb), we don't
> have any version selection, so we force using one specific version
> depending on the architecture.
> 
> Best regards,
> 
> Thomas
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
