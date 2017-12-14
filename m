From: robh+dt@kernel.org (Rob Herring)
Date: Thu, 14 Dec 2017 13:04:11 -0600
Subject: [PATCH] arc: dts: Remove leading 0x and 0s from bindings notation
In-Reply-To: <20171214165344.27795-1-malat@debian.org>
References: <20171214165344.27795-1-malat@debian.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_Jsq+vtq_rhkkyKo=ZntoLbe2vGxVvJ8Hx3xgHjT2GUKTDtQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Dec 14, 2017@10:53 AM, Mathieu Malaterre <malat@debian.org> wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
>
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
>
> and
>
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
>
> Converted using the following command:
>
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +
>
> For simplicity, two sed expressions were used to solve each warnings separately.
>
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before the
> the opening curly brace:
>
> https://elinux.org/Device_Tree_Linux#Linux_conventions
>
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
>
> Reported-by: David Daney <ddaney at caviumnetworks.com>
> Suggested-by: Rob Herring <robh at kernel.org>
> Signed-off-by: Mathieu Malaterre <malat at debian.org>
> ---

For the series,

Reviewed-by: Rob Herring <robh at kernel.org>
