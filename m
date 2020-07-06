Return-Path: <SRS0=D8Vs=AR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0220AC433E1
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Jul 2020 22:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD132067D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Jul 2020 22:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q0k60P8v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="APw1vFRm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LxJZia2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD132067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8BBMwLka4zeEAkc6Z0IVxmPwXLdn09ICpvx62Y1FbFM=; b=q0k60P8vfMgGEPfyGViED3j2W
	ybV6JbYTEACA3IJLBMlDYRqZT6RJujuK66DPN5HsTxCuPwQ/YbcxBzY7gw//IAQzueVsZy9eBMXVp
	12l4bw4vgXTDzNivw5YpQ/u8FpGYqIZ8tN9L9pCFXTTpaC746MtQ3s3hRBqiZ5jhF/jg3jtPaiRTx
	dc0Wd9kq2uyjMfvtoYvpnpFz2unXxkObIwPub8vjoWuelXz/dLSICOjT/6Jkud597jpgcO5yZGCLA
	SjnV8b63QX1Qn5IzZ3fmPk7+gT/J7ktkG4V3QUFhk/WONPlXy+4yLwer8tZgZKdUWL0l0th60Lb7W
	G/Ckv4oRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsa4W-0004kl-7S; Mon, 06 Jul 2020 22:58:48 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsa4T-0004kC-7W
 for linux-snps-arc@lists.infradead.org; Mon, 06 Jul 2020 22:58:46 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 22A59C06E1;
 Mon,  6 Jul 2020 22:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594076320; bh=csGRtcBMbag7r5UFTsfA2t1A6HSdNTiUdKqLdIjdvoI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=APw1vFRmLz9kcwZkmhaDuEF50qYlBH2hxAHj0KNPKXqKbmOnbXEf1qU14mjNX0RSm
 amx/l31eaaHTmHyXpzq9n7FWz3UDO8dRRNHqoiM+bB+wUY+4Obu9yt0IokyQQNEPXP
 5tShMCGfYol+Os7KpxZ7BOxtyyWj8KybmvQp/wpLEDxLBtyZ7Zdqbk+sFBrbZrIhLJ
 o75MD7273GSqQsDlJFMcjS4R2VcgGEXco5q+YVF/mI2NzWqC/rr1VwAgJXAl/JmOjd
 ut6dsFKR4FwXCsxMQrgYGcTDKpUHabRdFcciT4a2LXuQVzJsC+jBoIc4vowYFucTDw
 ba5Ifln99dUIA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C3A3A0081;
 Mon,  6 Jul 2020 22:58:32 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D320581141;
 Mon,  6 Jul 2020 22:58:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LxJZia2o";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lgugf0t3nSCWxydkf6Q0hc/An3MpUIb8cp/iClJwDX9HVV4nBQzjSmM40bOYXwlx+H1IIdPDb+EKhXA6XNYL+xWRCscesoAiMCAPXA8DRjzFqwJoIufxuxQqLyGrrlap+qarjpYvbHPNnG0X0+fKdRCxf9HxF5pd1B4VX2mBN28dCcR2KS8X0X3Co9S+WbG0YTTLAIX8WXYeT2HhCBmHQxgaIl5XK/yqtwXM9OlsNAGB1BsGP1S4moBIvenoGebkfYrYHfdtzvE84mbbNmYes8RRefUrDFPwBqN1puUKMECGEBW/0JprS/D8GHgOPCiJquw+nD3leDmSXnogJRbXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csGRtcBMbag7r5UFTsfA2t1A6HSdNTiUdKqLdIjdvoI=;
 b=PWOI+yddtuU61onDaLq1OKFAWRu4E4o2Z0EkTRE0V2t/fImp5pl+9iS8/lTCK0/NXSd6oyxAy1mrt+wpnG4Gdd1Fgxi8zcy2Bfeo1QVO9GLfSgjfPVH3NpQyA0fuvtfSqmfVZgNRCn9/DuIMuSL3dMrJfaaZisbzj/3gvCSBQtfHgz65jxunheXsoURAbLMehj0i/D5N90xe3uRqUL0MN/VpZRiU1ScwgosHhMKL/YizxSqoqL0ZGzFeuuFbPqBvzXnYXnX/9DY0AxKjnwk5PwKHbkbd3fZydB5dPje9yaQTMGZvD437KaqE3Q16uVokClzAB4HyF6oWqHtkmCR0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csGRtcBMbag7r5UFTsfA2t1A6HSdNTiUdKqLdIjdvoI=;
 b=LxJZia2oS9tfQkiuN20ERVspFKsU3B8J5O83kEplBA8Yn5ygTAXz6IVdpcCouv4VNBGr3smpJo2Ynn6JT48EjKmdPpgKR04BIXfbp1RAJmLkygAcqf1NfAipbKVKH0C2doo4daIRZSGB96A5OMNUJaRp6wUfOz4AideuzsiZ2X0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2807.namprd12.prod.outlook.com (2603:10b6:a03:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Mon, 6 Jul
 2020 22:58:27 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 22:58:27 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Thread-Topic: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Thread-Index: AQHWU+jzY9adT1jb60CTbjG6pNTOPA==
Date: Mon, 6 Jul 2020 22:58:27 +0000
Message-ID: <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
References: <20200217131735.18180-1-lukma@denx.de>
 <20200217131735.18180-2-lukma@denx.de>
In-Reply-To: <20200217131735.18180-2-lukma@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16edf763-2826-459c-9f34-08d822001840
x-ms-traffictypediagnostic: BYAPR12MB2807:
x-microsoft-antispam-prvs: <BYAPR12MB280794D7424833E9502A8D7CB6690@BYAPR12MB2807.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pCvLzJ0z8+TE32KXZBFBbnAL26+CLFB4WcUuwMngKps8AALdRn/HJB4OKdcOODWNCh/6Z3LUdGxU+iCAB2hYcxvrzYA1O0rubvB5jsqX9QLTSHGkDQI0xBTHKmjua66Hg/ZZASlL13W61jATAT/VKNBhbNfqoH5FwbINqsEVBg/SsrKdyfwPmaw7MQK9KruHxaPW1ei74ERMx1XyjaLcFLdpCmSvJdrZ8U54OjUVoTkCyW6fRXRsiMsVtyyfKkch35Gl8Btv09KP6lHfkHbyU0XjahvB2iJ31pN/Y77ABCsXJX6kvtG3559L89jmZCdaYFUfTFIf+TbEikhwm4smjZK7qUMq/oTOJ1gFGn5XJ92WoOzFq4l48LT07LSw+6XpiCnQJkj7Y19YRGz3lRop6Fr4ZW5EkS9s5xVJIcCTxi4xP2ARYRHuaE0oX7vKa7Ij8KcxqCGwUsYu4KJqh81kig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(71200400001)(31686004)(54906003)(86362001)(8676002)(6916009)(966005)(2906002)(6512007)(66476007)(6486002)(66446008)(6506007)(64756008)(66946007)(53546011)(66556008)(83380400001)(36756003)(76116006)(31696002)(8936002)(4326008)(5660300002)(316002)(2616005)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cJcLON+Ld0IxswWeLIWU3Zc6aVHTuihoR60hI7JE5jbAGKv0FvAWEvCzjwEOYd6MeutZ/850Fwi6p+YBTk6dgW9vYB3i7jMWeg0vKjMOjEGUZDjElTzEon3/zNgLvfAGhm3mjJl6m+zRQGG7N/i+bqCbvFeK7n07IHpZVkwl0T9mWuLfdoZls6Zuy63oRlbvoM/N4KBvH1rvuIGZLU1IhFIRXoPOeKxFd7zXNM4cBva4yabXvZn9X4ojcA0y4I/T29PmGL5L6PaaCs5SgS3vINlKUFzJcKxQ38ZjPi54ROxD/dYNbcREf6s8WfmB8xQOUOkc2TOA+va4u1RCnVO35cTjX/sPfPdbiR1FU3jI+wU1VnyzKPRWpgeexnwIz4LJW/e8oJkNepFYNCUg3ROSqSs48HzV84UnauZAOLUZi6Ep+1AuDiVjrPhECarYcVwcMhwS5nCmFWsAE8iIWSX+rO6iPxEsh4P7ds9RfvXwPRU0qYYfTHZvVVgQdKj6UmAe7hbd4CTacwcDV23+f4pmngaTWwhCatRG2dCSYuSnwLcDNXw59a37jAjRTLhKFxsJ
x-ms-exchange-transport-forked: True
Content-ID: <04636933ACAD1C43AE5D09FFC78F85E6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16edf763-2826-459c-9f34-08d822001840
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 22:58:27.3568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC+8D2K4/BYcPUZz6h25GavPH5eFZqGKBSdintiYwe5HBv2cvO+5S6e0tNrjIU2K9PB2DVT6vHmjnlKd1TxqEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_185845_698482_63E869EE 
X-CRM114-Status: GOOD (  31.99  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Lukasz,

On 2/17/20 5:17 AM, Lukasz Majewski wrote:
> This patch provides new __futimes64 explicit 64 bit function for setting file's
> 64 bit attributes for access and modification time (by specifying file
> descriptor number).
> 
> Internally, the __utimensat64_helper function is used. This patch is necessary
> for having architectures with __WORDSIZE == 32 Y2038 safe.
> 
> Moreover, a 32 bit version - __futimes has been refactored to internally use
> __futimes64.
> 
> The __futimes is now supposed to be used on systems still supporting 32
> bit time (__TIMESIZE != 64) - hence the necessary conversion of struct timeval
> to 64 bit struct __timeval64.
> 
> The check if struct timevals' usec fields are in the range between 0 and 1000000
> has been removed as Linux kernel performs it internally in the implementation
> of utimensat (the conversion between struct __timeval64 and __timespec64 is not
> relevant for this particular check).
> 
> Last but not least, checks for tvp{64} not being NULL have been preserved from
> the original code as some legacy user space programs may rely on it.
> 
> Build tests:
> ./src/scripts/build-many-glibcs.py glibcs
> 
> Run-time tests:
> - Run specific tests on ARM/x86 32bit systems (qemu):
>   https://github.com/lmajewski/meta-y2038 and run tests:
>   https://github.com/lmajewski/y2038-tests/commits/master
> 
> Above tests were performed with Y2038 redirection applied as well as without to
> test the proper usage of both __futimes64 and __futimes.
> ---
>  include/time.h                    |  3 +++
>  sysdeps/unix/sysv/linux/futimes.c | 42 +++++++++++++++++--------------

ARC is 32-bit + TIMESIZE==64 but the new code is not getting built (instead
generic variant is). How do I override the generic fiel to be built instead ?

>  2 files changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/include/time.h b/include/time.h
> index b81ecd5e6e..c24066bf3a 100644
> --- a/include/time.h
> +++ b/include/time.h
> @@ -210,8 +210,11 @@ extern int __utimensat64_helper (int fd, const char *file,
>  libc_hidden_proto (__utimensat64_helper);
>  
>  #if __TIMESIZE == 64
> +# define __futimes64 __futimes
>  # define __futimens64 __futimens
>  #else
> +extern int __futimes64 (int fd, const struct __timeval64 tvp64[2]);
> +libc_hidden_proto (__futimes64);
>  extern int __futimens64 (int fd, const struct __timespec64 tsp[2]);
>  libc_hidden_proto (__futimens64);
>  #endif
> diff --git a/sysdeps/unix/sysv/linux/futimes.c b/sysdeps/unix/sysv/linux/futimes.c
> index 4bea864470..21b41e4138 100644
> --- a/sysdeps/unix/sysv/linux/futimes.c
> +++ b/sysdeps/unix/sysv/linux/futimes.c
> @@ -17,35 +17,39 @@
>     <https://www.gnu.org/licenses/>.  */
>  
>  #include <errno.h>
> -#include <sysdep.h>
> -#include <string.h>
>  #include <time.h>
> -#include <utime.h>
> -#include <sys/time.h>
> -#include <_itoa.h>
> -#include <fcntl.h>
> -
>  
>  /* Change the access time of the file associated with FD to TVP[0] and
> -   the modification time of FILE to TVP[1].
> +   the modification time of FILE to TVP[1].  */
> +int
> +__futimes64 (int fd, const struct __timeval64 tvp64[2])
> +{
> +  /* The utimensat system call expects timespec not timeval.  */
> +  struct __timespec64 ts64[2];
> +  if (tvp64 != NULL)
> +    {
> +      ts64[0] = timeval64_to_timespec64 (tvp64[0]);
> +      ts64[1] = timeval64_to_timespec64 (tvp64[1]);
> +    }
> +
> +  return __utimensat64_helper (fd, NULL, tvp64 ? &ts64[0] : NULL, 0);
> +}
> +
> +#if __TIMESIZE != 64
> +libc_hidden_def (__futimes64)
>  
> -   Starting with 2.6.22 the Linux kernel has the utimensat syscall which
> -   can be used to implement futimes.  */
>  int
>  __futimes (int fd, const struct timeval tvp[2])
>  {
> -  /* The utimensat system call expects timespec not timeval.  */
> -  struct timespec ts[2];
> +  struct __timeval64 tv64[2];
> +
>    if (tvp != NULL)
>      {
> -      if (tvp[0].tv_usec < 0 || tvp[0].tv_usec >= 1000000
> -          || tvp[1].tv_usec < 0 || tvp[1].tv_usec >= 1000000)
> -	return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
> -
> -      TIMEVAL_TO_TIMESPEC (&tvp[0], &ts[0]);
> -      TIMEVAL_TO_TIMESPEC (&tvp[1], &ts[1]);
> +      tv64[0] = valid_timeval_to_timeval64 (tvp[0]);
> +      tv64[1] = valid_timeval_to_timeval64 (tvp[1]);
>      }
>  
> -  return INLINE_SYSCALL (utimensat, 4, fd, NULL, tvp ? &ts : NULL, 0);
> +  return __futimes64 (fd, tvp ? &tv64[0] : NULL);
>  }
> +#endif
>  weak_alias (__futimes, futimes)
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
